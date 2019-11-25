class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :winch, foreign_key: true
      t.references :car, foreign_key: true
      t.string :description
      t.datetime :arrival_time
      t.datetime :delivery_time
      t.string :status
      t.float :win_init_lat
      t.float :win_init_long
      t.float :car_lat
      t.float :car_long
      t.float :dest_lat
      t.float :dest_long
      t.integer :total_distance
      t.integer :total_price

      t.timestamps
    end
  end
end
