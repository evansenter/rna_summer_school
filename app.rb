require "sinatra/base"
require "json"

class RnaSummerSchool < Sinatra::Base
  configure do
    set :root, File.dirname(__FILE__)
    set :app_file, __FILE__
    set :port, ENV["PORT"]
    set :protection, except: [:frame_options]
  end

  get "/" do
    @tab = "home"
    haml :home
  end

  get "/schedule" do
    @tab      = "schedule"
    @calendar = JSON.parse(File.read(File.join(Dir.pwd, "views", "schedule", "calendar.json"))).map do |event|
      %w|start_time end_time|.inject(event) do |hash, key|
        hash.merge(key => (Time.parse(hash[key]).utc + Time.zone_offset("EST")))
      end.tap do |hash|
        if hash.has_key?("abstract")
          hash["abstract"] = File.read(File.join(Dir.pwd, "views", "schedule", "abstract_%s.txt" % hash["abstract"]))
        end
      end
    end.group_by { |hash| hash["column"] }
    haml :schedule
  end

  %i|location about|.each do |root_symbol|
    get "/#{root_symbol}" do
      @tab = root_symbol.to_s
      haml root_symbol
    end
  end
end
