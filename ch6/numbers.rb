#Ruby supports integers and floating-point, rational and complex numbers.
#Integers are held internally in binary form of class Fixnum.
num = 10001
5.times do
  puts "#{num.class}: #{num}"
  num *= num
end


