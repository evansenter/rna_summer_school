require "sinatra/base"

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

  run! if app_file == $0
end
