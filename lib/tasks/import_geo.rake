require 'csv'

desc "Import teams from csv file"
task :import_geo => [:environment] do

  file = "db/geodata.csv"

  CSV.foreach(file, :headers => true) do |row|
    Geolocation.create ({
      :address => row[0],
      :latitude => row[1],
      :longitude => row[2],
      :borough => row[3],
      :neighborhood => row[4]
    })
  end

end