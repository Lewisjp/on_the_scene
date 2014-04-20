class CreateGeoScenes < ActiveRecord::Migration
  def change
    create_table :geo_scenes do |t|
      t.integer :scene_id
      t.integer :geolocation_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
