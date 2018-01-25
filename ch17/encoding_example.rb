# coding: ascii
def show_encoding(str)
  puts "'#{str}' (size #{str.size}) is #{str.encoding.name}"
end

show_encoding("cat")
