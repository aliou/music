require 'sinatra'
require 'date'
require 'json'
require 'redis'

REDIS_SERVER = ENV['REDISTOGO_URL'] || "redis://localhost:6379"
uri = URI.parse(REDIS_SERVER)
$redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)

class Music < Sinatra::Application
  get '/' do
    @music = $redis['songs']
    erb :index
  end
end
