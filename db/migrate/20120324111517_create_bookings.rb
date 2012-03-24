class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :booking_reference
      t.datetime :date_time
      t.integer :venue_id
      t.integer :user_id

      t.timestamps
    end
  end
end
