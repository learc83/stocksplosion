class Analyzer
	def initialize(price_array)
		error_str = "Not Enough Data for Analysis" 
		raise ArgumentError.new(error_str) unless price_array.length > 2 
		@price_array = price_array
	end

	#calculate the simple moving averge over last days_back. Using floating point
	#shouldn't matter for the calculations we're doing since they don't rely on 
	#high precision
	def simple_moving_avg(days_back)
		#get prices from n days_back
		prices = @price_array[-days_back..-1]

		#calculate SMA
		prices.inject{ |sum, element| sum + element }.to_f / prices.size
	end

	
end