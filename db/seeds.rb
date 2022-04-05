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
  puts "Creating - > #{record['title']}"
  if record['master_id'] == 0
    Record.create(title: record["title"], image: record["cover_image"], year: record["year"], masterid: 0, label: record["label"].first)
  else
    tracklisturl = "https://api.discogs.com/masters/#{record['master_id']}"
    master = URI.open(tracklisturl).read
    tracklist = JSON.parse(master)['tracklist']
    tracklist.each do |track|
      if track["artists"] != nil
        if Artist.find_by(name: track['artists'].flatten['name']) == nil
          Artist.create(name: track["artists"].flatten["name"])
        end
      end
      if track["extraartists"] != nil
        track["extraartists"].each do |artist|
          if Artist.find_by(name: artist['name']) == nil
            Artist.new(name: artist["name"]).save
            puts "Created Artist: #{artist["name"]}"
          end
        end
      end
      Track.create(title: track["title"], position: track["position"], record_id: Record.last.id, artist_id: Artist.last.id)
      puts "Created track: #{track["title"]} - Record: #{Record.last.id} - Artist: #{Artist.last.id}"
    end
    Record.create(title: record["title"], image: record["cover_image"], year: record["year"], masterid: record["master_id"], label: record["label"].first)
  end  
  puts "Done!"
end
