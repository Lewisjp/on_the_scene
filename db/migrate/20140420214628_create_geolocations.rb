class CreateGeolocations < ActiveRecord::Migration
  def change
    create_table :geolocations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :borough
      t.string :neighborhood
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
