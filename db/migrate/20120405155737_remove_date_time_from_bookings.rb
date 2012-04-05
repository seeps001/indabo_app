class RemoveDateTimeFromBookings < ActiveRecord::Migration
  def up
    remove_column :bookings, :date_time
  end

  def down
    add_column :bookings, :date_time, :datetime
  end
end
