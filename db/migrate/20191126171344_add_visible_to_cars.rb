class AddVisibleToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :visible, :boolean, default: true
  end
end
