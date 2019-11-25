class AddVisibleToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :visible, :boolean
  end
end
