def fizzbuzz(number)
  divisible_by = ->(d){ ->(n){ n % d == 0 } }
  case number
  when divisible_by.(15)
    'fizzbuzz'
  when divisible_by.(3)
    'fizz'
  when divisible_by.(5)
    'buzz'
  else
    number
  end
end
