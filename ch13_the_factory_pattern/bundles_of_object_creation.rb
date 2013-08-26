# Instead of passing the individual plant and animal classes to Habitat,
# we can pass a single object that knows how to create a consistant set of products.

# We will have one object for creating ponds and another for creating jungles.

# An object dedicated to creating a compatible set of objects is called
# an abstract factory.

class PondOrganismFactory
	def new_animal(name)
		Frog.new(name)
	end

	def new_plant(name)
		Algea.new
	end
end

class JungleOrganismFactory
	def new_animal(name)
		Tiger.new(name)
	end

	def new_plant(name)
		Tree.new
	end
end

class Habitat
	def initialize(number_animals, number_plants,
		             organism_factory)
		@organism_factory = organism_factory

		@animals = []
		number_animals.times do |i|
			animal = @organism_factory.new_animal("Animal #{i}")
			@animals << animal
		end

		@plants = []
		number_plants.times do |i|
			plant = @organism_factory.new_plant("Plant #{i}")
			@plants << plant
		end
	end

	def simulate_one_day
		@plants.each {|plant| plant.grow}
		@animals.each {|animal| animal.speak}
		@animals.each {|animal| animal.eat}
		@animals.each {|animal| animal.sleep}
	end
end

jungle = Habitat.new(2, 4, JungleOrganismFactory.new)
jungle.simulate_one_day

pond = Habitat.new(2,4, PondOrganismFactory.new)
pond.simulate_one_day