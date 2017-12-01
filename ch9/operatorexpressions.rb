#Operator Expressions

a, b, c = 1, 2, 3
a * b + c # => 5 in essence this is the same as the following
(a.*(b)).+(c) # => 5


#Operator expressions can be written for composed classes:
class ScoreKeeper
  def initialize
    @total_score = @count = 0
  end

  def <<(score)
    @total_score += score
    @count += 1
    self
  end

  def average
    raise 'No scores' if @count.zero?
    Float(@total_score) / @count
  end
end
