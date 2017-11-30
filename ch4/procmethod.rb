def doUntilFalse(i, my_proc)
  input = i
  output = i

  while output
    input = output
    output = my_proc.call input
  end

  input
end

buildArrayOfSquares = proc do |array|
  lastNumber = array.last
  if lastNumber <= 0
    false
  else
    array.pop
    array.push lastNumber * lastNumber
    array.push lastNumber - 1
  end
end

def compose(p1, p2)
  proc do |x|
    p2.call(p1.call(x))
  end
end

square = proc do |x|
  x * x
end

double = proc do |x|
  x + x
end

doubleThenSquare = compose(double, square)
squareThenDouble = compose(square, double)
