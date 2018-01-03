sum = 0
threads = 10.times.map do
  Thread.new do
    100_000.times do
      new_value = sum + 1
      print "#{new_value}   " if new_value % 250_000 == 0
      sum = new_value
    end
  end
end
threads.each(&:join)
puts "\nsum = #{sum}"

#MUTEX- controls access to a resource and then lock it when you want to use that resource.
#If no one else has it locked, the thread continues to run.
sum = 0
mutex = Mutex.new
threads = 10.times.map do
  Thread.new do
    100_000.times do
      mutex.lock
      new_value = sum + 1
      print "#{new_value}   " if new_value % 250_000 == 0
      sum = new_value
      mutex.unlock
    end
  end
end

threads.each(&:join)
puts "\nsum=#{sum}"

#Mutex#synchronize - locks the mutex, runs the block and then unlocks the mutex.
sum = 0
mutex = Mutex.new
threads = 10.times.map do
  Thread.new do
    100_000.times do
      mutex.synchronize do
        new_value = sum + 1
        print "#{new_value}   " if new_value % 250_000 == 0
        sum = new_value
      end
    end
  end
end
threads.each(&:join)
puts "\nsum = #{sum}"

