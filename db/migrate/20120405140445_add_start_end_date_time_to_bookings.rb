class AddStartEndDateTimeToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
    add_column :bookings, :start_time, :time
    add_column :bookings, :end_time, :time
  end
end
