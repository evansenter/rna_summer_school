require "sinatra/base"
require "json"

class RnaSummerSchool < Sinatra::Base
  configure do
    set :app_file, __FILE__
    set :port, ENV["PORT"]
    set :public_folder, File.join(Dir.pwd, "components")
  end

  get "/" do
    @tab = "home"
    haml :home
  end

  get "/schedule" do
    @tab      = "schedule"
    @calendar = JSON.parse(File.read(File.join(Dir.pwd, "views", "calendar.json"))).map do |event|
      %w|start_time end_time|.inject(event) do |hash, key|
        hash.merge(key => (Time.parse(hash[key]).utc + Time.zone_offset("EST")))
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

  run! if app_file == $0
end
