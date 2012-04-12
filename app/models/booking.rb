class Booking < ActiveRecord::Base

	belongs_to :user
	belongs_to :venue

	validates  :venue_id, :booking_reference, :start_date, :end_date, :start_time, :end_time, :description, :presence => true

	before_validation :create_reference

	def create_reference
		self.booking_reference = rand(36**8).to_s(36) if self.booking_reference.nil?
	end
end
