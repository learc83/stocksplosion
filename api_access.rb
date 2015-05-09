require 'rest_client'

# We're using a class here soley for namespacing
class ApiAccess
	def self.list_companies
		"x, y, z"
	end

	def self.get_detail(symbol)
		"symbol #{symbol}"
	end

	def self.get_decision(symbol)
		"symbol decision #{symbol}"
	end
end