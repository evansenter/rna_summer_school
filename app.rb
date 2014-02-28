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

  %i|schedule location resources about|.each do |root_symbol|
    get "/#{root_symbol}" do
      @tab = root_symbol.to_s
      haml root_symbol
    end
  end

  get "/api/calendar.json" do
    content_type :json

    calendar = JSON.parse(File.read(File.join(Dir.pwd, "views", "calendar.json"))).map do |event|
      %w|start end|.inject(event) do |hash, key|
        hash.merge(key => Time.parse(hash.delete("%s_datetime" % key)).to_i * 1000)
      end
    end

    { success: 1, result: calendar }.to_json
  end

  run! if app_file == $0
end
