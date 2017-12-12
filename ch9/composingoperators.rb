class Scorekeeper
  def initialize
    @total_score = @count = 0
  end

  def <<(score)
    @total_score += score
    @count += 1
  end

  def average
    raise 'no scores' if @count.zero?
    Float(@total_score) / @count
  end
end


