require "sinatra/base"

class RnaSummerSchool < Sinatra::Base
  configure do
    set :app_file, __FILE__
    set :port, ENV["PORT"]
    set :public_folder, File.join(Dir.pwd, "components")
  end
  
  %w|/ /home|.each do |string|
    get string do
      haml :home
    end
  end
  
  %i|schedule location resources about|.each do |root_symbol|
    get "/#{root_symbol}" do
      haml root_symbol
    end
  end

  run! if app_file == $0
end
