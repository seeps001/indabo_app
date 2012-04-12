module VenuesHelper

	def category_search_url(category_string)
		"/venues?" + {:search => {:venue_category => category_string }}.to_param
	end

end
