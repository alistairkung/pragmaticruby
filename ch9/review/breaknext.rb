def print_for_5_sec
  Enumerator.new do |y|
    time = Time.now
    num = 0
    while Time.now <= time + 5
      num += 1
      next if num % 5 == 0
      y << num 
    end
  end
end

def print_for_5_sec_range
  time = Time.now
  (1..Float::INFINITY).each do |n|
    next if n % 5 == 0
      puts n
    break if Time.now >= time + 5
  end
end

