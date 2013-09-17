require 'sinatra'
require 'date'
require 'json'
require 'redis'
require 'lastfm'

REDIS_SERVER = ENV['REDISTOGO_URL'] || "redis://localhost:6379"
uri = URI.parse(REDIS_SERVER)
$redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)

$lastfm_client = Lastfm.new ENV['LASTFM_KEY'], ENV['LASTFM_SECRET']

class Music < Sinatra::Application
  get '/' do
    @music = $redis['songs']
    erb :index
  end
end
