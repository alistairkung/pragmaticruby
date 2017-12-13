def fib_enumerator
  Enumerator.new do |y|
    a = b = 1
    loop do
      y << a
      a, b = b, a + b
    end
  end
end

def accumulating_fib
  Enumerator.new do |y|
    fib_enumerator.reduce(0) do |sum, i|
      sum += i
      y << sum
      sum
    end
  end
end

def five_seconds(enumerator)
  Enumerator.new do |y|
    time = Time.now
    while Time.now <= time + 5
      n = enumerator.next
      next if n.even?
      y << n
    end
  end
end
