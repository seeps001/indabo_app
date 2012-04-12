class AddConfirmedToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :confirmed, :boolean
  end
end
