class CreateGroupGearItems < ActiveRecord::Migration[6.0]
  def change
    create_table :group_gear_items do |t|
      t.integer :user_hikes_id
      t.string :name
      t.integer :qty
      t.string :notes

      t.timestamps
    end
  end
end
