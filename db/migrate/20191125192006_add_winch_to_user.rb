class AddWinchToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :winch, :boolean, default: false
  end
end
