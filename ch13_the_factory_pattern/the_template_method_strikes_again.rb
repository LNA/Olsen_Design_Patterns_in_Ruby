# Can solve the problem of which class to use by using a subclass:

class Pond
  def initialize(number_animals)
    @animals = []
    number_animals.times do |i|
      animal = new_animal("Animal #{i}")
      @animals << animal
    end
  end

  def simulate_one_day
    @animas.each {|animal| animal.speak}
    @animas.each {|animal| animal.eat}
    @animas.each {|animal| animal.sleep}
  end
end

# We can build two subclasses of Pond; one for ducks one for frog

class DuckPond < Pond
  def new_animal(name)
    Duck.new(name)
  end
end

class FrogPond < Pond
  def new_animal(name)
    Frog.new(name)
  end
end

# Now we can fill the correct pond with the correct animals:

pond = FrogPond.new(3)
pond.simulate_one_day