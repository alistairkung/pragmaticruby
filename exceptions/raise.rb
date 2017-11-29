def raise_exception
  puts 'I am before the raise'
  raise 'This is the raised exception'
  puts 'I am afeter the raise'
end

def inverse(x)
  raise ArgumentError, 'Argument is not numeric' unless x.is_a? Numeric
  1.0 / x
end

def raise_and_rescue
  begin
    puts 'I am before the raise.'
    raise 'An error has occured'
    puts 'I am after the raise'
  rescue
    puts 'I am rescued'
  end
  puts 'I am after the begin block'
end
