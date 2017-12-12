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
  def check_my_int(number)
    case number
    when 1
      'potato'
    when 2
      'chimichanga'
    when 3
      'potato chimichanga'
    else
      number.inspect
    end
  end
end
