#IO is a bidirectional channel between a Ruby program and some external resource.
#Creating File Object:
file = File.new('testfile', 'r')
# ... process file
file.close
#Takes two parameters: (filename, mode)

#Opening file:
File.open('testfile', 'r') do |file|
  # ... process file
end #file automatically closes in block

#Reading and Writing
#gets reads a line from File object
File.open('testfile') do |file|
  while line = file.gets
    puts line
  end
end
