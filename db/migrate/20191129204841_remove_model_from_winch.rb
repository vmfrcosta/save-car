class RemoveModelFromWinch < ActiveRecord::Migration[5.2]
  def change
    remove_column :winches, :model, :string
  end
end
