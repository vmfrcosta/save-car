class AddWinCurrentLatToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :win_current_lat, :float
  end
end
