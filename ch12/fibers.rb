#Fibers
#Fibers allow execution of one part of a program to be suspended, for another part to be run.
#Fibers are a simple coroutine mechanism.
words = Fiber.new do
  File.foreach('testfile') do |line|
    line.scan(/\w+/) do |word|
      Fiber.yield word.downcase #yield suspends the execution of the block, passing value given to Fiber.yield
    end
  end
  nil
end
#The constructor for the Fiber class takes a block and returns a fiber object.
counts = Hash.new(0)
while word = words.resume # calling resume on the fiber object causes the block to start execution.
  counts[word] += 1
end

counts.keys.sort.each {|k| print "#{k}:#{counts[k]} "}

