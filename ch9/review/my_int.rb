class MyInt
  def initialize(number)
    @number = number
  end
  def +(num)
    @number += num
    self
  end
  def -(num)
    @number -= num
    self
  end
  def *(num)
    @number *= num
    self
  end
  def /(num)
    @number /= num
    self
  end
end
