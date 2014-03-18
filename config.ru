require "./app.rb"

map "/assets" do
  run Rack::Directory.new(File.join(Dir.pwd, "components"))
end

run RnaSummerSchool
