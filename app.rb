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

# Return company stock price history and decision
get '/company_detail/:symbol/:start_date' do |sym, start|
	ApiAccess.get_detail(sym, start)
end
