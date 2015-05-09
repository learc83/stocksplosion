require 'sinatra'
require 'date'
require 'json'
require_relative 'api_access.rb'
require_relative 'analyzer.rb'

# Sinatra Routes

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
get '/company_detail/:symbol/:created/:days_back' do |sym, created, days_back|
	content_type :json

	#Check to make sure that there is enough data to go back days_back
	created_date = Date.parse(created)
	start_date = Time.now.to_date - days_back.to_i

	puts created_date
	puts start_date

	if created_date > start_date
		return "{'error': Stock is too new to go back #{days_back} days.}"
	end

	response = ApiAccess.get_detail(sym, start_date)

	json_hash = JSON.parse(response)
	date_prices = json_hash['prices']
	#get just the prices
	prices = date_prices.map {|r| r[1]}
	
	analyzer = Analyzer.new(prices)

	return_value = {'prices' => date_prices, 'decision' => analyzer.buy_sell_or_wait}

	JSON.generate(return_value)
end

#Helper Functions

