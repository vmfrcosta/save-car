class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.references :user, foreign_key: true
      t.string :brand
      t.string :model
      t.string :plate
      t.string :type

      t.timestamps
    end
  end
end
