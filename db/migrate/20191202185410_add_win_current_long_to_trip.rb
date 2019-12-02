class AddWinCurrentLongToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :win_current_long, :float
  end
end
