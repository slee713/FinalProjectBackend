class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :answer_id
      t.boolean :value

      t.timestamps
    end
  end
end
