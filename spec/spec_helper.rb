ENV['RACK_ENV'] = 'test'
require("rspec")
require("pg")
require("sinatra/activerecord")
require("players")
require('teams')
require('pry')


RSpec.configure do |config|
  config.after(:each) do
    Band.all().each() do |player|
      Band.destroy()
    end
  end
end
