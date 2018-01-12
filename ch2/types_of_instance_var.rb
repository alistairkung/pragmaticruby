class MyClass
  attr_reader :instance_variable_of_instance, :other_variable

  @instance_variable_of_class = "other"

  def initialize
    @instance_variable_of_instance = "hi"
  end

  def self.other_variable_reader
    @instance_variable_of_class
  end

end
