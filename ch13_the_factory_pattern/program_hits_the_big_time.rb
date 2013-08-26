# We want to model a jungle.
# We can use the Pond class but change the name to Habitat.

class Tree
	def initialize(name)
		@name = name
	end

	#deleted methods of tree behavior
end

class Tiger
	def initialize(name)
		@name = name
	end

	#deleted methods of tiger behavior
end

jungle = Habitat.new(1, Tiger, 4, Tree)
jungle.simulate_one_day

pond = Habitat.new(2, Duck, 3, Waterlily)
jungle.simulate_one_day

# This leaves room for unstable classes:

unstable = Habitat.new(2, Tiger, 4, Waterlily)

# Tigers and water lilies don't belong in the same habitat.

# See bundles_of_object_creation.rb to fix this mess!