class AddCarAddressToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :car_address, :string
  end
end
