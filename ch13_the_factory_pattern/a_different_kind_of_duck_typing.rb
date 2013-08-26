# In this chapter, Olsen builds a pond which tracks what the ducks are up to.

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

class Pond
	def initialize(number_ducks)
		@ducks = []
		number_ducks.times do |i|
			duck = Duck.new("Duck #{i}")
			@ducks << duck
		end
	end

	def simulate_one_day
		@ducks.each {|duck| duck.speak}
		@ducks.each {|duck| duck.eat}
		@ducks.each {|duck| duck.sleep}
	end
end

pond = Pond.new(3)
pond.simulate_one_day

# A Frog class that has the same interface as the ducks:

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

# Problem: the Pond class is built only for creating ducks.
# We need to seperate the thing that is changing in the Pond (duck/frog) from the
# thing that stays the same (other workings of the pond class)

# Problem: which class to use... Duck or Frog???

