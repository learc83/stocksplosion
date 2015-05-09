require 'sinatra'
require_relative 'api_access.rb'

# Sinatra Routes

get '/' do
  File.read(File.join('public', 'index.html'))
end

#These method basically act as proxies for the stocksplosion api. We could
#call them from the client, but by placing them here we have more flexibility
#Render them directly to html, JavaScript doesn't have to deal with any future
#authentication that may be added to the API etc...
get '/list_companies' do
	ApiAccess.list_companies
end

# Return company stock price history and decision
get '/company_detail/:symbol/:start_date' do |sym, start|
	ApiAccess.get_detail(sym, start)
end
