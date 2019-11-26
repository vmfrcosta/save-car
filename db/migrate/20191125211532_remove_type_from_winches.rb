class RemoveTypeFromWinches < ActiveRecord::Migration[5.2]
  def change
    remove_column :winches, :type, :string
  end
end
