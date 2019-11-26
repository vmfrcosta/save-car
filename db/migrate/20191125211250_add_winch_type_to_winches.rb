class AddWinchTypeToWinches < ActiveRecord::Migration[5.2]
  def change
    add_column :winches, :winch_type, :string
  end
end
