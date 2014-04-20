require 'csv'

desc "Import scenes from csv file"
task :import_scene => [:environment] do

  file = "db/scenedata.csv"

  CSV.foreach(file, :headers => true) do |row|
    Scene.create ({
      :title => row[0],
      :year => row[1],
      :IMDB => row[2],
      :address => row[3],
      :geolocation_id => row[4]
    })
  end

end