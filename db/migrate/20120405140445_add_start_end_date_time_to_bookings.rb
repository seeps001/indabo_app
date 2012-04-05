class AddStartEndDateTimeToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :start_date_time, :datetime
    add_column :bookings, :end_date_time, :datetime
  end
end
