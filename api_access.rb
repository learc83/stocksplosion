require 'rest-client'

# We're using a class here solely for namespacing
class ApiAccess
	@@headers = {
  		:content_type => 'application/json'
	}

	#FUTURE consider making these methods non-blocking, and consider
	#caching responses
	def self.list_companies
		RestClient.get 'http://stocksplosion.apsis.io/api/company', @@headers
	end

	def self.get_detail(symbol, start_date)
		now = Time.now
		end_date = now.strftime("%Y%m%d")
		start = start_date.strftime("%Y%m%d")

		RestClient.get "http://stocksplosion.apsis.io/api/company/#{symbol}"\
			"?startdate=#{start}&enddate=#{end_date}", @@headers
	end
end