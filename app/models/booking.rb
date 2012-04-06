class Booking < ActiveRecord::Base

	belongs_to :user
	belongs_to :venue

	before_save :create_reference

	def create_reference
		self.booking_reference = rand(36**8).to_s(36) if self.booking_reference.nil?
	end
end
