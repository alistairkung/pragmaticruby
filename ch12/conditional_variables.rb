mutex = Mutex.new

cv = ConditionVariable.new
a = Thread.new do
  mutex.synchronize do
    puts "A: I have critical section, but will wait for CV"
    cv.wait(mutex)
    puts "A: I have critical section again! I rule!"
  end
end

puts "Later"

b = Thread.new do
  mutex.synchronize do
    puts "B: Now I am critical, but am done with cv"
    cv.signal
    puts "B: I am still critical, finishing up"
  end
end

a.join
b.join
