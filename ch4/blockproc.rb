def array_init(n = 5, &block)
  Array.new(n, &block)
end
