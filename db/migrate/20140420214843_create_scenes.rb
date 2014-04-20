class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :title
      t.date :year
      t.string :IMDB
      t.string :address
      t.integer :geolocation_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
