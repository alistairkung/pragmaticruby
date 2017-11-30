sum_of_fib = Enumerator.new do |y|
  fib = Enumerator.new do |y|
    i1 = i2 = 1
    loop do
      y.yield i1
      i1, i2 = i2, i1+i2
    end
  end
  fib.reduce(0) do |sum, i|
    sum += i
    y.yield sum
    sum
  end
end
