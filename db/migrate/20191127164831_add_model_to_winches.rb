class AddModelToWinches < ActiveRecord::Migration[5.2]
  def change
    add_column :winches, :model, :string
  end
end
