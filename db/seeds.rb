require 'open-uri'
require 'json'

Box.destroy_all
puts "Destroying boxes..."
Track.destroy_all
puts "Destroying tracks..."
Record.destroy_all
puts "Destroying records..."
Artist.destroy_all
puts "Destroying artists..."

consumer_key = ENV['CONSUMER_KEY']
consumer_secret = ENV['CONSUMER_SECRET']

# get records from api
url = "https://api.discogs.com/database/search?label=giegling&key=#{consumer_key}&secret=#{consumer_secret}"

puts url

buffer = URI.open(url).read
result = JSON.parse(buffer)['results']
result.each do |record|
  sleep(10)
  puts record["title"]
  artist = record["title"].scan(/^(.*?)\-/).flatten.first
  Artist.create(name: artist)
  puts "Created artist: #{Artist.last.name}"

  puts "Creating - > #{record['title']}"
  if record['master_id'] == 0
    Record.create(title: record["title"], image: record["cover_image"], year: record["year"], masterid: 0, label: record["label"].first)
  else
    tracklisturl = "https://api.discogs.com/masters/#{record['master_id']}"
    master = URI.open(tracklisturl).read
    tracklist = JSON.parse(master)['tracklist']
    Record.create(title: record["title"], image: record["cover_image"], year: record["year"], masterid: record["master_id"], label: record["label"].first)
    tracklist.each do |track|
      Track.create(title: track["title"], position: track["position"], record_id: Record.last.id, artist_id: Artist.last.id)
      puts "Created track: #{track["title"]} - Record: #{Record.last.id} - Artist: #{Artist.last.name}"
    end
  end  
  puts "Done!"
end
