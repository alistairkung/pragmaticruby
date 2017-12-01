##Example of inheritance with super
class Animal
  attr_reader :species

  def initialize(species)
    @species = species
  end

  def eat
    puts "#{species} eats some food"
  end
end

class Cow < Animal
  def initialize
    super("Cow")
  end
end
