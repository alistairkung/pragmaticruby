#Exceptions
#
#Exception Class
#Information about an exception is encapsulated in an object of class Exception or its children.
#
#Exception Handling
#To handle exceptions, code that can raise exceptions are enclosed in a begin/end block, using rescue clauses to handle exceptions.
require 'open-uri'
page = "podcasts"
file_name = "#{page}.html"
web_page = open("http://pragprog.com/#{page}")
output = File.open(file_name, "w")
begin
  while line = web_page.gets
    output.puts line
  end
  output.close
rescue Exception
  STDERR.puts "Failed to download #{page}: #{$!}"
  output.close
  File.delete(file_name)
  raise
end
