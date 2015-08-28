require 'bundler/setup'
Bundler.require(:default)
require 'pry'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

###INDEX###

get '/' do
  erb :index
end

###BAND###

get '/bands' do
  @band = Band.all()
  erb(:band_list)
end

get '/band/:bid' do
  id = params.fetch('bid')
  @band = Band.find(id)
  erb :band_edit
end

patch '/band/:bid' do
  new_band = params.fetch('new_band')
  id = params.fetch('bid')
  band = Band.find(id)
  band.update({band: new_band})
  redirect "/bands"
end

delete '/band/:bid' do
  bid = params.fetch('bid')
  band = Band.find(bid)
  band.destroy
  redirect '/bands'
end

post '/band/new' do
  new_band = params.fetch('band')
  Band.create(band: new_band)
  redirect '/bands'
end

###concert###

get '/concerts' do
  @concerts = Concert.all()
  erb(:concert_list)
end

get '/concert/:cid' do
  cid = params.fetch('cid')
  @concert = Concert.find(cid)
  @bands = Band.all
  erb(:concert_edit)
end

patch '/concert/:cid' do
  cid = params.fetch('cid')
  new_concert = params.fetch(new_concert)
  concert = Concert.find(cid)
  concert.update({:concert => new_concert})
  redirect "/concerts"
end

post '/concert/new' do
  @concert = Concert.create(concert: params['concert'])
  redirect "/concerts"
end

delete '/concert/:cid' do
  cid = params.fetch('cid')
  @concert = Concert.find(cid)
  @concert.destroy()
  redirect "/concerts"
end

post '/concert/:cid/band/new' do
  cid = params.fetch('cid')
  fetched_band = Band.find(params['band'].to_i)
  concert = Concert.find(cid)
  new_band = Band.new(band: fetched_band)
  new_band.save
  concert.bands.push(fetched_band)
  redirect "/concert/#{cid}"
end
