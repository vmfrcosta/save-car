class CreateGuinchos < ActiveRecord::Migration[5.2]
  def change
    create_table :guinchos do |t|
      t.string :brand
      t.string :model

      t.timestamps
    end
  end
end
