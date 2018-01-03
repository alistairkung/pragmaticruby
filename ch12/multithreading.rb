#Threads
#Simplest way to do two things at once.
#
#Creating new threads:
#Thread.new {block contains code to run in a new thread}

require 'net/http'

pages = %w( www.rubycentral.org slashdot.org www.google.com )

threads = pages.map do |page_to_fetch|
  Thread.new(page_to_fetch) do |url|
    http = Net::HTTP.new(url, 80)
    print "Fetching: #{url}\n"
    resp = http.get('/')
    print "Got #{url}: #{resp.message}\n"
  end
end

#When a Ruby program terminates, all threads are killed, regardless of their states.
#You can wait for a particular thread to finish by calling that thread's Thread#join method.
threads.each {|thr| thr.join}
#by calling join on each of the requested threads, you ensure all three requests are completed before terminating the program.
#join can also receive a timeout parameter- if the timeout expires before tha thread terminates, join returns nil.

#Thread Variables
#
#A thread has access to any variables in scope when the thread is created.
#Variables local to the block containing the thread are local and not shared.
#
#To access thread local variables, access elements as if it were a hash i.e. [:var_name]
count = 0
threads = 10.times.map do |i|
  Thread.new do
    sleep(rand(0.1))
    Thread.current[:mycount] = count
    count += 1
  end
end

threads.each {|t| t.join; print t[:mycount], ", "}
puts "count = #{count}"
