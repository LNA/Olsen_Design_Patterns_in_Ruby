# We can get rid of the hierarchy of Pond subclasses
# by storing the classes of objects that we want to create
# in instance variables:

class Pond
	def initialize(number_animals, animal_class,
		             number_plants, plant_class)

		@animal_class = animal_class
		@plant_class = plant_class
								
		@animals = []
		number_animals.times do |i|
			animal = new_orginism(:animal, "Animal #{i}")
			@animals << animal
		end

		@plants = []
		number_plants.times do |i|
			plant = new_orginism(:plant, "Plant #{i}")
			@plants << plant
		end
	end

	def simulate_one_day
		@plants.each {|plant| plant.grow}
		@animals.each {|animal| animal.speak}
		@animals.each {|animal| animal.eat}
		@animals.each {|animal| animal.sleep}
	end

	def new_organism(type, name)
		if type == :animal  
			@animal_class.new(name)
		elsif type == :plant 
			@plant_class.new(name)
		else
			raise "unknown organism type: #{type}"
		end
	end
end

pond = Pond.new(3, Duck, 2, WaterLily)
pond.simulate_one_day