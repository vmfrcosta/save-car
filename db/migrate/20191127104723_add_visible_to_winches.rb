class AddVisibleToWinches < ActiveRecord::Migration[5.2]
  def change
    add_column :winches, :visible, :boolean, default: true
  end
end
