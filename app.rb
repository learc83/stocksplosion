require 'sinatra'
require_relative 'api_access.rb'

# Sinatra Routes

get '/' do
  File.read(File.join('public', 'index.html'))
end

# Return entire list of symbols for autocomplete
#TODO maybe return names as well
#WARNING we might have to change strategies if the list grows too long
get '/list_companies' do
	ApiAccess.list_companies
end

get '/company_detail/:symbol' do |sym|
	ApiAccess.get_detail(sym)
end

get '/stock_decision/:symbol' do |sym|
	ApiAccess.get_decision(sym)
end

