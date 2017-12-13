def accumulative_fib
  Enumerator.new do |y|
    fib = Enumerator.new do |w|
      a = b = 1
      loop do
        w << a
        a, b = b, a + b
      end
    end
    fib.reduce(0) do |sum, i|
      sum += i
      y << sum
      sum
    end
  end
end

def fizzbuzz_enum(enumerator)
  Enumerator.new do |y|
    loop do
      divisible_by = ->(d){ ->(n){ n % d == 0 } }
      n = enumerator.next
      fb = case n
           when divisible_by.(15)
             'fizzbuzz'
           when divisible_by.(3)
             'fizz'
           when divisible_by.(5)
             'buzz'
           else
             n
           end
      y << [n, fb]
    end
  end
end
