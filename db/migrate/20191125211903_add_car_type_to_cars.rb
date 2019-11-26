class AddCarTypeToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :car_type, :string
  end
end
