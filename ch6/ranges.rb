#ranges express sequences
#..
'a'..'z'
1..10
# ranges can be converted into ranges or enumerators:
(1..10).to_a
('bar'..'bat').to_enum
#other range methods:
digits = 0..9
digits.include?(5) # => true
digits.max # => 9
digits.reject {|i| i < 5} # => [5, 6, 7, 8, 9]
digits.inject(:+) # => 45

#Ranges can be used as conditional expressions in loops
while line = gets
  puts line if line =~ /start/ .. line =~ /end/
end

#Ranges can be used as an interval test via ===:
(1..10) === 5 # => true
(1..10) === 11 # => false
#This allows use in case statements

