class RemoveAddressFromTrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :address, :string
  end
end
