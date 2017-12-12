print "(t)imes or (p)lus: "
operator = gets
print "numbers: "
number = Integer(gets)

if operator =~ /^t/
  calc = lambda { |n| n*number }
else
  calc = lambda { |n| n+number }
end

puts((1..10).collect(&calc).join(", "))
