require 'time'
require 'zlib'
require 'fiber'

line = Struct.new(:timestamp, :loglevel, :context, :message)
lines = Fiber.new do
  Zlib::GzipReader.open('pipeline.gz') do |f|
    f.each_line do |l|
      if l.match(/\[(\h{4}-\h{2}-\h{2}\s\h{2}:\h{2}:\h{2}.\h{3})\]/)
        matches = l.match(/\[(\h{4}-\h{2}-\h{2}\s\h{2}:\h{2}:\h{2}.\h{3})\]\s\[(\D+?)\]\s(\w.+?)\-\s(.*)/)
        timestamp, level, context, message = matches[1], matches[2], matches[3], matches[4]
        line_entry = line.new(timestamp,level,context,message)
        Fiber.yield line_entry if line_entry.message.include?("dead_entry") 
      end
    end
  end
  nil
end

message = Struct.new(:timestamp, :uuid, :index_uuid, :shard)
messages = Fiber.new do
  while lines.alive?
    l = lines.resume
    message_attributes = l.message.match(/(\w{8}-\w{4}-\w{4}-\w{4}-\w{12}).*(\w{22}).*(\d+)/)
    time = Time.parse(l.timestamp)
    Fiber.yield message.new(time, message_attributes[1], message_attributes[2], message_attributes[3])
  end
  nil
end

while messages.alive?
  print messages.resume
end
