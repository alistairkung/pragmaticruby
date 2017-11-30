# This was an exercise demonstrating different ways to read a file via blocks/procs/lambdas

#Using yield:
def read(file, &block)
  File.open(file, 'r') { |f| yield f}
end
#File.open creates a file object which is passed to the block and yielded

#Using block without yielding
def read(file, &block)
  File.open(file, 'r') { |f| block.call(f) }
end

#Shortcut of the above, & turns the initial provided block into a proc which when passed inside the open method, becomes reformed into a block
def read(file, &block)
  File.open(file, 'r', &block)
end
#This demonstrates the fundamental concept that all methods can have received n number of arguments and a block.
#Also, & can turn a block into a proc and vice versa

#Using proc instead of blocks
def read(file, myproc)
  File.open(file, 'r') { |f| myproc.call(f) }
end

#Shortcut for procs/lambdas
def read(file, myproc)
  File.open(file, 'r', &myproc)
end

#a lambda can be passed to this method without any alterations, due to the fact that there are no differences to arguments provided
