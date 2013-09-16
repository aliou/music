require 'date'
require 'lastfm'

class FetchMusic
  def initialize(date = Date.today)
    @client = Lastfm.new ENV['LASTFM_KEY'], ENV['LASTFM_SECRET']
    @end_date = date
    @begin_date = @end_date - 7
  end

  def fetch
    default_options = {
      :user => 'aliouftw',
      :limit => 200
    }
    @values = []
    (@begin_date..@end_date).each do |date|
      opts = default_options.merge(:from => date.strftime('%s').to_i,
                                   :to   => date.next.strftime('%s').to_i)
      songs = @client.user.get_recent_tracks(opts)
      if songs.nil?
        @values << 0
      else
        @values << songs.length
      end
    end
  end

  def save
    $redis["songs"] = JSON.dump({
      labels: (@begin_date..@end_date).map { |d| d.strftime('%d-%m').to_i },
      datasets:
      {
        fillColor: "rgba(220,220,220,0.5)",
        strokeColor: "rgba(220,220,220,1)",
        data: @values
      }
    })
  end
end
