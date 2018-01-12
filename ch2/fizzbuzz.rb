#if multiple of 3 = fizz, if multiple of 5 buzz, if both fizzbuzz, if neither reuturn n

def fizzbuzz(number)
  divisible_by = ->(divisor) { -> (n) { n % divisor == 0 } }
  case number
  when divisible_by.(15)
    'FizzBuzz'
  when divisible_by.(5)
    'Buzz'
  when divisible_by.(3)
    'Fizz'
  else
    number
  end
end

#This works because case compares by calling ===, which for a lambda essentially executes .call(number):
# divisible_by.(15) === 45
# The above is same as below:
# divisible_by.(15).(45)
