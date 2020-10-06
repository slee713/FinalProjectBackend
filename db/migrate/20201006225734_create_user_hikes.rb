class CreateUserHikes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_hikes do |t|
      t.integer :user_id
      t.integer :hiking_trip_id

      t.timestamps
    end
  end
end
