class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :user_hike_id
      t.text :content

      t.timestamps
    end
  end
end
