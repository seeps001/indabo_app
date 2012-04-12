class Venue < ActiveRecord::Base

has_many :bookings

	def self.search(location, category, size)
	  if location && location != ""
	  	if category && category != ""
	  		if size && size != ""
	  			where("location LIKE ? OR venue_category LIKE ? OR venue_size LIKE ?", "%#{location}%", "%#{category}%", "%#{size}%")
	  		else
	  			where("location LIKE ? OR venue_category LIKE ?", "%#{location}%", "%#{category}%")
	  		end
	  	elsif size && size != ""
	  		where("location LIKE ? OR venue_size LIKE ?", "%#{location}%", "%#{size}%")
	  	else
	  		where("location LIKE ?", "%#{location}%")
	  	end
	  elsif category && category != ""
	  	if size && size != ""
	  		where("venue_category LIKE ? OR venue_size LIKE ?", "%#{category}%", "%#{size}%")
	  	else
	  		where("venue_category LIKE ?", "%#{category}%")
	  	end
	  elsif size && size != ""
	  	where("venue_size LIKE ?", "%#{size}%")
	  else
	  	all
	  end
	end
end