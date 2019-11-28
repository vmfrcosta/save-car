class AddDestAddressToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :dest_address, :string
  end
end
