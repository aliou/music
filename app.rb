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
    @song_count = $redis['song_count']
    @last_song = $lastfm_client.user.get_recent_tracks(:user => 'aliouftw',
                                                       :limit => 1)
    @last_song = @last_song.first unless @last_song.class != Array
    erb :index
  end
end
