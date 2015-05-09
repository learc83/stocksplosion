require 'sinatra'

#Sinatra Routes

get '/' do
  File.read(File.join('public', 'index.html'))
end

get '/list_companies' do
	'list of companies'
end

get '/company_detail/:id' do |id|
	"company id: #{id}"
end

get '/stock_decision/:id' do |id|
	"buy company id: #{id}"
end