require 'sinatra'
require 'date'
require 'json'
require_relative 'api_access.rb'
require_relative 'analyzer.rb'

#Routes
get '/' do
  File.read(File.join('public', 'index.html'))
end

#These methods basically act as proxies for the stocksplosion api. We could
#call them from the client, but by placing them here we have more flexibility
#Render them directly to html, JavaScript doesn't have to deal with any future
#authentication that may be added to the API etc...
get '/list_companies' do
	content_type :json
	ApiAccess.list_companies
end

# Return company stock price history and decision
get '/company_detail/:symbol/:days_back' do |sym, days_back|
	content_type :json

	#Check to make sure that there is enough data to go back days_back
	#created_date = Date.parse(created)
	start_date = Time.now.to_date - days_back.to_i

	#if created_date > start_date
	#	return "{'error': Stock is too new to go back #{days_back} days.}"
	#end

	generate_detail_response(sym, start_date)
end


#Helper Functions
def generate_detail_response(sym, start_date)
	#TODO handle error from ApiAccess
	response = ApiAccess.get_detail(sym, start_date)

	json_hash = JSON.parse(response)
	date_prices = json_hash['prices']
	
	#get just the prices
	prices = date_prices.map {|r| r[1]}
	puts prices;

	#TODO handle error from analyzer "not enough data"
	analyzer = Analyzer.new(prices)

	#Strip year from dates
	date_prices =  Hash[date_prices.map {|k,v| [to_month_day(k),v]}]

	return_value = {'prices' => date_prices, 
		'decision' => analyzer.buy_sell_or_wait}

	JSON.generate(return_value)
end

def to_month_day(date)
	new_date = Date.parse(date)
	new_date.strftime("%m-%d")
end
