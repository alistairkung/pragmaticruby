#hello method from Parents, Modules
class Potato
  def hello
    "hello"
  end
end

module PotatoModule
  def hello
    "hi"
  end
end

#extend makes module methods available to the class, include -> instance of class
class Chimichanga < Potato
  extend PotatoModule
  def say_hello(name)
    print "#{hello} #{name}"
  end
end

#class methods can be rewritten

class Array
  def min
    "this smallest number is #{sort[0]}"
  end
end


class Thing
  include Enumerable

  def initialize(arr)
    @arr = arr
  end

  def each
    @arr.each do |n|
      yield n
    end
  end

end
