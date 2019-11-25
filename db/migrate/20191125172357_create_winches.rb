class CreateWinches < ActiveRecord::Migration[5.2]
  def change
    create_table :winches do |t|
      t.references :user, foreign_key: true
      t.string :brand
      t.string :type
      t.string :plate
      t.integer :price_per_km
      t.float :win_lat
      t.float :win_long
      t.boolean :on_duty

      t.timestamps
    end
  end
end
