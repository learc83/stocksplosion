require 'rest-client'

# We're using a class here solely for namespacing
class ApiAccess
	#FUTURE consider making these methods non-blocking, and consider
	#caching responses
	def self.list_companies
		headers = {
  			:content_type => 'application/json'
		}

		RestClient.get 'http://stocksplosion.apsis.io/api/company', headers
	end

	def self.get_detail(symbol, start_date)
		get_detail_from_API(symbol, start_date)
	end

	def self.get_decision(symbol, start_date)
		response = get_detail_from_API(symbol, start_date)
	end


	def self.get_detail_from_API(symbol, start_date) 
		headers = {
  			:content_type => 'application/json'
		}

		now = Time.now
		end_date = now.strftime("%Y%m%d")

		RestClient.get "http://stocksplosion.apsis.io/api/company/DXBT"\
			"?startdate=#{start_date}&enddate=#{end_date}", headers
	end
	private_class_method :get_detail_from_API
end