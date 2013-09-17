require "./app"
require_relative "./tasks/fetch_music"

desc "Fetch Music"
task :fetch do
  fetcher = FetchMusic.new
  fetcher.fetch
  fetcher.save
end
