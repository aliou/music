require 'date'
require 'lastfm'

class FetchMusic
  def initialize(date = Date.today - 1)
    @end_date = date
    @begin_date = @end_date - 6
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
      songs = $lastfm_client.user.get_recent_tracks(opts)
      if songs.nil?
        @values << 0
      else
        @values << songs.length
      end
    end
  end

  def save
    $redis["songs"] = JSON.dump({
      labels: (@begin_date..@end_date).map { |d| d.strftime('%d-%m') },
      datasets: [
        {
          fillColor: 'rgba(255,67,41,0.3)',
          strokeColor: 'rgba(255,67,41,1)',
          pointColor: 'rgba(255,67,41,1)',
          pointStrokeColor: "#fff",
          data: @values
        }
      ]
    })
  end
end
