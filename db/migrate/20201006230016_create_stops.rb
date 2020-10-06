class CreateStops < ActiveRecord::Migration[6.0]
  def change
    create_table :stops do |t|
      t.integer :hiking_trip_id
      t.integer :stop
      t.string :name
      t.integer :elevation
      t.float :distance
      t.string :notes

      t.timestamps
    end
  end
end
