# Our Pond simulation is so popular that users start asking you to simulate plants ans well as animals.

class Algae
	def initialize(name)
		@name = name
	end

	def grow
		puts("The Algea #{@name} soaks up the sun and grows")
	end
end

class WaterLily
	def initialize(name)
		@name = name
	end

	def grow
		puts("The water lily #{@name} floats, soaks up the sun, and grows")
	end
end

class Duck # What they do
	def initialize(name)
		@name = name
	end

	def eat
		puts("Duck #{name} is eating.")
	end

	def speak
		puts("Duck #{name} says Quack!")
	end

	def sleep
		puts("Duck #{name} sleeps quietly.")
	end
end

class Frog # What they do
	def initialize(name)
		@name = name
	end

	def eat
		puts("Frog #{name} is eating.")
	end

	def speak
		puts("Frog #{name} says Quack!")
	end

	def sleep
		puts("Frog #{name} sleeps quietly.")
	end
end

# We can modify the Pond class to deal with plants.
# It will produce either a plant or animal depending
# on the symbol passes in: 

class Pond
	def initialize(number_animals, number_plants)
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
end

# We need to modify the subclasses:

class DuckWaterLilyPond < Pond
	def new_orginism(type, name)
		if type == :animal
			Duck.new(name)
		elsif type == :plant
			WaterLily.new(name)
		else 
			raise "Unknown organism type: #{type}"
		end
	end
end