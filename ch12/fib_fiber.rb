fib = Fiber.new do
  a, b = 1, 2
  loop do
    Fiber.yield(a)
    a, b = b, a + b
  end
end

