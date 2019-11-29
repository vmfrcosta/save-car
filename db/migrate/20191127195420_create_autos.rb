class CreateAutos < ActiveRecord::Migration[5.2]
  def change
    create_table :autos do |t|
      t.string "model"
      t.string "brand"
      t.timestamps
    end
  end
end
