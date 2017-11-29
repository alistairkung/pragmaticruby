class MyClass
  attr_reader :my_variable, :other_variable

  @instance_variable_of_class = "other"

  def initialize
    @instance_variable_of_instance = "hi"
  end

  def self.other_variable_reader
    @instasnce_variable_of_class
  end

end
