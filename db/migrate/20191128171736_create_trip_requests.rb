class CreateTripRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_requests do |t|
      t.references :trip, foreign_key: true
      t.references :winch, foreign_key: true
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
