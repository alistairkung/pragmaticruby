#And, Or, Not

#&&
##Returns the first argument if it is false, otherwise it evaluates and returns the second argument:

nil && 99 # => nil
false && 99 # => false
"cat" && 99 # => 99

##Returns True only if both sides evaluate to True

true && 100 % 2 == 0 # => true

#||
##Returns the first argument unless it is false, in which it evaluates and returns the second argument:

nil || 99 # => 99
false || 99 # => 99
"cat" || 99 # => "cat"
false || 100 % 2 == 0 # => true

#||=
##Assigns a value to a variable, only if that variable is not already sets

var ||= "default value"

#demonstration of != and == being defined. if only == is defined, it will be used to perform both != and == comparisons
class T
  def ==(other)
    puts "comparing self == #{other}"
    other == "value"
  end
  def !=(other)
    puts "comparing self != #{other}"
    other != "value"
  end
end

