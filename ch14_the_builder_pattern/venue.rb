# Code to create a venue, without using a builder...
class Venue
	attr_accessor :staff
	attr_accessor :menu
	attr_accessor :seating
	
	def initialize(bar_size = :small, menu = Menu.new, staff =[])
		@staff = staff
		@menu = menu
		@bar = bar
	end
end

class Dinner
	#code for creating basic dinner menu items
end

class American < Dinner
	# code for american dishes
end

class SmallPlates < Dinner
	#code for creating small plates
end

class Menu
	attr_accessor :dinner
	attr_accessor :number_of_menu_items
	def initialize(dinner = American.new, number_of_items = 10)
		@dinner = dinner
		@number_of_items = number_of_items
	end
end

class Schedule
	attr_reader :employee
	attr_reader :shift
	attr_reader :position

	def initialize(employee, shift, position)
		@employee = employee
		@shift = shift
		@position = position
	end
end

fall_menu = Menu.new(SmallPlates.new, 20)
staff = []
staff << Schedule.new(:Indra, :pm, :waitress)
staff << Schedule.new(:LaToya, :pm, :bartender)
staff << Schedule.new(:Tony, :pm, :floor_manager)

venue = Venue.new(:small, fall_menu, staff)

	# The better way? Use a builder class to assemble all of the components of
	# this complex object.

class VenueBuilder
	attr_reader :venue

	def initialize 
		@venu = Venu.new
	end

	def small_plates(has_smallplates_based_menu = true)
		@venue.menu.dinner = SmallPlates.new
	end

	def bar_size=(bar_size)
		@venue.bar_size = bar_size
	end

	def number_of_menu_items(number)
		@venue.menu.number_of_menu_items = number
	end

	def add_staff
		@venue.staff << Schedule.new(:Indra, :pm, :waitress)
	end
end

builder = VenueBuilder.new
builder.small plates
builder.bar_size(large)
builder.number_of_menu_items(20)
builder.add_staff

venue = builder.venue

# Polymorphic builders:


# Lets say we want to build 2 different types of venues;
# A special events space and a live music venue.

class EventSpace < Venue
	# lots of code to make a special event space
end

class LiveMusicSpace < Venue
	#omitted code
end

# An events space and a live music space will have things in common.
# We can stick those things into an abstract base builder
# and then create an EventSpaceBuilder and a LiveMusicBuilder
# to handle individual instances of each class.

class VenueBuilder
	attr_reader :venues

	def small_plates(has_smallplates_based_menu = true)
		@venue.menu.dinner = SmallPlates.new
	end

	def stage(has_stage=true)
		@venue.stage = Stage.new
	end
end

class EventSpaceBuilder < VenueBuilder
	def initialize
		@venue = EventSpace.new
	end

	def bar_size=(bar_size)
		@venue.bar_size = bar_size
	end

	def number_of_menu_items(number)
		@venue.menu.number_of_menu_items = number
	end

	def add_staff
		@venue.staff << Schedule.new(:Indra, :pm, :waitress)
	end
end

class LiveMusicSpaceBuilder < VenueBuilder
	def initialize
		@venue = LiveMusicSpace.new
	end

	def bar_size=(bar_size)
		raise "The bar at any live music venue must be large" unless bar_size ==
		:large
	end

	def number_of_menu_items(number)
		@venue.menu.number_of_menu_items = number
	end

	def add_staff
		@venue.staff << Schedule.new(:MikeFinnagan, :pm, :soundguy)
	end
end