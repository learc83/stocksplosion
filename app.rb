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

get '/company_detail/:symbol/:start_date' do |sym, start|
	ApiAccess.get_detail(sym, start)
end

get '/stock_decision/:symbol/:start_date' do |sym, start|
	ApiAccess.get_decision(sym, start)
end

