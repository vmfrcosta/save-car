class AddWinchToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :winch, :boolean
  end
end
