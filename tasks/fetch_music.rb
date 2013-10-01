require 'date'
require 'lastfm'

class FetchMusic
  def initialize(date = Date.today - 1)
    @end_date = date
    @begin_date = @end_date - 6
  end

  def fetch
    @data = []
    default_options = {
      :user => 'aliouftw',
      :limit => 200
    }
    (@begin_date..@end_date).each do |date|
      opts = default_options.merge(:from => date.strftime('%s').to_i,
                                   :to   => date.next.strftime('%s').to_i)
      @data += $lastfm_client.user.get_recent_tracks(opts)
    end
    @data.delete_if {|t| t.include? "nowplaying"}
    fetch_songs
    fetch_artist
  end

  def fetch_songs
    @song_count = []
    (@begin_date..@end_date).each do |date|
      songs = @data.select {|t| Date.strptime(t["date"]["uts"], '%s') == date}
      @song_count << songs.length
    end
  end

      else
        @values << songs.length
      end
    end
  end

  def save
    $redis["song_count"] = JSON.dump({
      labels: (@begin_date..@end_date).map { |d| d.strftime('%d-%m') },
      datasets: [
        {
          fillColor: 'rgba(255,67,41,0.3)',
          strokeColor: 'rgba(255,67,41,1)',
          pointColor: 'rgba(255,67,41,1)',
          pointStrokeColor: "#fff",
          data: @song_count
        }
      ]
    })
  end
end
