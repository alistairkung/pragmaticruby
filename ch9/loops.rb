l = "a"

while l != "aa"
  puts l
  l = l.next
end

l = "a"

loop do
  puts l
  l = l.next #l.next! also works
  break if l == "aa"
end

l = "a"

until l == "aa"
  puts l
  l = l.next
end

('a'..'z').each do |l|
  puts l
end

('a'..'z').to_a.each do |l|
  puts l
end

l = "a"

("z".ord - "a". ord + 1).times do
  puts l
  l = l.next
end

# letter, index number difference between the order and index

('a'..'z').to_a.select { |l| l != "m" }.each_with_index do | l, i |
  puts "#{l} #{i} #{l.ord - i}"
end

def printletters
  l = "a"
  until l == "aa"
    yield l
    l = l.next
  end
end
