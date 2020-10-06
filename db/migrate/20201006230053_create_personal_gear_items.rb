class CreatePersonalGearItems < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_gear_items do |t|
      t.integer :user_id
      t.string :name
      t.integer :qty
      t.string :notes

      t.timestamps
    end
  end
end
