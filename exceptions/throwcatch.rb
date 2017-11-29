wordlist = ["one", "two", "three", nil, "four"]
result = []
word_in_error = catch(:done) do
  wordlist.each do |w|
    throw(:done, w) unless w =~ /^\w+$/
    result.push(w.reverse)
  end
end
if word_in_error
  puts "#{w} found, but word was expected"
end
