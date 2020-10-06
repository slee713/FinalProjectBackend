class CreateHikingTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :hiking_trips do |t|
      t.integer :hiking_project_id
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
