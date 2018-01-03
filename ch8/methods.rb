#Defining methods
#
#Methods should begin with a lowercase letter or underscore
#Can end with one of ? ! or =
#? usually follows methods that return boolean values
#! represent dangerous methods that modify their receivers
#= represents assignments
#
#Parameters
#List of params are declared in parenthesis (arg, arg1, arg2)
#Can be assigned default values:
def cool_dude(arg1 ="Miles", arg2 = "Coltrane", arg3 = "Roach")
  "#{arg1}, #{arg2}, #{arg3}"
end

#Variable-Length Argument Lists
#you can capture multiple arguments into a single parameter with a * prceding the parameter name:
def varargs(arg1, *rest)
  "arg1=#{arg1} rest = #{rest.inspect}"
end
#parameters are bundled into an array
#* can also be used to specify arguments that are used by a corresponding method in a superclass:
class Child < Parent
  def something(*)
    super
  end
end

#Methods and blocks
#
#Methods can be associated with a block which is called via yield
def double(p1)
  yield(p1*2)
end

double(3) {|v| "I got #{val}"} # => "I got 6"
double("tom") {|v| "I got #{val}"} # => "I got tomtom"

#if the last parameter ina method definition is prefixed with an ampersand, any associated block is converted to a proc and assigned to the parameter.
class TaxCalculator
  def initialize(name, &block)
    @name, @block = name, block
  end
  def get_tax(amount)
    "#@name on #{amount} = #{ @block.call(amount) }"
  end
end

#If the last argument to a method is prececed by an ampersand, Ruby assumes that it is a proc object and converts the proc into a block:
print "(t)imes or (p)lus: "
operator = gets
print "number: "
number = Integer(gets)
if operator =~ /^t/
  calc = lambda {|n| n*number}
else
  calc = lambda {|n| n + number}
end
puts((1..10).collect(&calc).join(", "))

#Keyword Arguments
#Arguments can be defined in methods.
#This validates(i.e. ensuring no uknown arguments are passed) and extracts hash parameters to methods.
def search(field, genre: nil, duration: 120)
  p [ field, genre, duration ]
end
#any unknown parameters raises an error.
#this can be prevented if a double splat is used:
def search(field, genre: nil, duration: 120, **other)
  p [ field, genre, duration, other ]
end

options = { duration: 432, stars: 3, genre: "jazz", tempo: "slow" }
search(:title, options) # => [ :title, "jazz", 432, {:stars => 3, :tempo => "slow" } ]

