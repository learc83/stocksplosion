require_relative '../analyzer'
require "test/unit"

class TestAnalyzer < Test::Unit::TestCase
	@@valid_price_array = [17057.15, 16894.07, 15899.8]
	@@invalid_price_array = [17057.15, 16894.07]
	@@sma_price_array = [50.0, 1.00, 2.00, 3.00]

	def test_init 
		assert_raise ArgumentError do 
			Analyzer.new(@@invalid_price_array)
		end

		assert_nothing_raised ArgumentError do
			Analyzer.new(@@valid_price_array)
		end
	end

	def test_simple_moving_avg
		analyzer = Analyzer.new(@@sma_price_array)

		assert_equal(2, analyzer.simple_moving_avg(3))
		assert_equal(2.5, analyzer.simple_moving_avg(2))
	end

end