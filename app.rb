require 'sinatra'

# Sinatra Routes

get '/' do
  File.read(File.join('public', 'index.html'))
end

# Return entire list of symbols for autocomplete
#TODO maybe return names as well
#WARNING we might have to change strategies if the list grows too long
get '/list_companies' do
	'list of companies'
end

get '/company_detail/:symbol' do |sym|
	"company id: #{sym}"
end

get '/stock_decision/:symbol' do |sym|
	"buy company id: #{sym}"
end