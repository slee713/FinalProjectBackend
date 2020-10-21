class AddImgToHikingTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :hiking_trips, :img, :string
  end
end
