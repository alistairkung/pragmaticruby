#Using split to process raw files
Song = Struct.new(:title, :name, :length)
#Struct creates a data structure with given attributes
File.open("songdata") do |song_file|
  songs = []
  song_file.each do |line|
    file, length, name, title = line.chomp.split(/\s*\|\s*/)
    name.squeeze!(" ")#squeeze trims run of repeated characters
    mins, secs = length.scan(/\d+/)
    songs << Song.new(title, name, mins.to_i*60 + secs.to_i)
  end
  puts songs[0]
end
