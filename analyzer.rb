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

	def buy_sell_or_wait
		long_sma = simple_moving_avg(30)
		short_sma = simple_moving_avg(4)

		#alpha can be tuned with more data
		alpha = 0.005
		sensitivity = long_sma * alpha

		#Simplistic version of the SMA crossover algorithm. If the Short term 
		#SMA is higher by a certain threshold, then the stock is on the way up
		#If the Long term SMA is higher by the same threshold, the stock is
		#likely headed down. Else do nothing.
		if (short_sma - long_sma) > sensitivity
			return 'buy'
		elsif (long_sma - short_sma) > sensitivity
			return 'sell'
		else
			return 'wait'
		end
	end
end