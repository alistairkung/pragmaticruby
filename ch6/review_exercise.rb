require 'csv'
require 'time'
require 'zlib'

lines = []
line = Struct.new(:timestamp, :loglevel, :context, :message)

#Read pipeline.gz line by line without extracting
#Convert each line in an object containing timestamp, loglevel, context and message
Zlib::GzipReader.open('pipeline.gz') do |f|
  f.each_line do |l|
    #drop all lines that don't start with a timestamp
    if l.match(/\[(\h{4}-\h{2}-\h{2}\s\h{2}:\h{2}:\h{2}.\h{3})\]/)
      matches = l.match(/\[(\h{4}-\h{2}-\h{2}\s\h{2}:\h{2}:\h{2}.\h{3})\]\s\[(\D+?)\]\s(\w.+?)\-\s(.*)/)
      timestamp, level, context, message = matches[1], matches[2], matches[3], matches[4]
      lines << line.new(timestamp,level,context,message)
    end
  end
end

#Filter for all the messages containing a failure to insert in dead entries
lines.select! { |l| l.message.include?("dead_entry") }

#Find beginning and end of the problem (in ISO8601)
problem_start = Time.parse(lines.first.timestamp).iso8601
problem_end = Time.parse(lines.last.timestamp).iso8601

messages = []
#Creating message object containing timestamp, uuid, index uuid, shard
message = Struct.new(:timestamp, :uuid, :index_uuid, :shard)
lines.each do |l|
  message_attributes = l.message.match(/(\w{8}-\w{4}-\w{4}-\w{4}-\w{12}).*(\w{22}).*(\d+)/)
  time = Time.parse(l.timestamp)
  messages << message.new(time, message_attributes[1], message_attributes[2], message_attributes[3])
end

#Creating Hash containing UUID => [index_uuid, shard]
uuid_hash = {}
messages.each do |m|
  uuid_hash[m.uuid] = [m.index_uuid, m.shard]
end

#Writing a CSV containing UUID, Index UUID, shard
CSV.open('output', 'w') do |csv|
  csv << ["time", "entry_uuid", "index_uuid", "shard"]
  messages.each do |m|
    #hiding the last segment of Entry uuid
    censored_uuid = m.uuid.sub(/\w{12}/, 'x'*12)
    csv << [m.timestamp, censored_uuid, m.index_uuid, m.shard]
  end
end

#Creating hash that groups messages by minute
messages_hash = Hash.new { |h, k| h[k] = [] }
messages.each do |m|
  time_truncated = m.timestamp - m.timestamp.sec
  range = time_truncated..time_truncated + 60
  messages_hash[range.to_s] << m
end

#Creating hash containing count by range
messages_count = Hash.new(0)
messages.each do |m|
  time_truncated = m.timestamp - m.timestamp.sec
  range = time_truncated..time_truncated + 60
  messages_count[range.to_s] += 1
end

print lines.length
print problem_start
print problem_end
print uuid_hash
print messages
print messages_count
require 'pry';binding.pry
