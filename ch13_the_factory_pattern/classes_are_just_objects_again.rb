# Instead of having several different abstract factory classes,
# we can have just one factory class that stores the class objects of the 
# things it needs to produce:

class OrganismFactory
	def initialize(plant_class, animal_class)
		@plant_class = plant_class
		@animal_class = animal_class
	end

	def new_animal(name)
		@animal_class.new(name)
	end

	def new_plant(name)
		@plant_class.new(name)
	end
end

# We can create a new instance of the factory for each compatible
# set of objects that we need:

jungle_organism_factory = OrganismFactory.new(Tree, Tiger)

pond_organism_factory = OrganismFactory.new(WaterLily, Frog)

jungle = Habitat.new(1, 4, jungle_organism_factory)
jungle.simulate_one_day

pond = Habitat.new(2, 4, pond_organism_factory)
pond.simulate_one_day