#by including the Enumerable module and defining an each iterator, all methods such as inject become available to the composed class.

class VowelFinder
  include Enumerable

  def initialize(string)
    @string = string
  end

  def each
    @string.scan(/[aeiou]/) do |v|
      yield v
    end
  end
end
