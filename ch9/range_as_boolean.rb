#A range can be used as a boolean expression:
#Returns true when event happens then staying true until a second event occurs.
#normally used within loops.
file = File.open('ordinal')
while line = file.gets
  puts(line) if line =~ /third/ .. line =~ /fifth/
end
