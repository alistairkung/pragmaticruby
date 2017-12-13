#Ruby supports integers and floating-point, rational and complex numbers.
#Integers are held internally in binary form of class Fixnum.
num = 10001
5.times do
  puts "#{num.class}: #{num}"
  num *= num
end

#Looping
##Integers support several iterators:

3.times { print "x " }
#=> x, x, x
1.upto(5) { |i| print i, " " }
#=> 1, 2, 3, 4, 5
99.downto(95) { |i| print i, " " }
#=> 99, 98, 97, 96, 95
50.step(80, 5) { |i| print i, " " }
#=> 50, 55, 60, 65, 70, 75, 80


