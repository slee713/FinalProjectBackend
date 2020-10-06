class CreateFoodPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :food_plans do |t|
      t.integer :user_hike_id
      t.date :day
      t.string :breakfast
      t.string :lunch
      t.string :dinner
      t.string :snacks
      t.string :notes

      t.timestamps
    end
  end
end
