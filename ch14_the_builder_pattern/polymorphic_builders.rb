# Lets say we want to build two types of computers: 
# desktop and laptop.

class DesktopComputer < Computer 
	#lots of code
end

class LaptopComputer < Computer
	def initialize(motherboard= Motherboard.new, drives = [])
		super(:lcd, motherboard, drives)
	end

	#lots of laptop code
end

# The components of a desktop are different than that of a laptop.
# We can refactor the builder into a base class
# and two subclasses to take care of the differences.

# The abstract base builder (class ComputerBuilder) deals with the details that are
# common to the two kinds of computers.  Then we create a
# DesktopBuilder to create instances of desktop computers
# and a LaptopBuilder to create instances of laptop computers.

class ComputerBuilder
	attr_reader :computers

	def turbo(has_turbo_cpu=true)
		@computer.motherboard.cpu = TurboCPU.new
	end

	def momory_size(size_in_mb)
		@computer.motherboard.memory_size = size_in_mb
	end
end

class DesktopBuilder < ComputerBuilder
	def initialize
		@computer = DesktopComputer.new
	end

	def display=(display)
		@display = display
	end

	def add_cd(writer=false)
		@computer.drives << Drive.new(:cd, 760, writer)
	end

	def add_dvd(writer=false)
		@computer.drives << Drive.new(:dvd, 4000, writer)
	end

	def add_hard_disk(size_in_mb)
		@computer.drives << Drive.new(:hard_disk, size_in_mb, true)
	end
end

class LaptopBuilder < ComputerBuilder
	def initialize
		@computer = LaptopComputer.new
	end

	def display=(display)
		raise "laptop display must be lcd" unless display == :lcd
	end
	def add_cd(writer=false)
		@computer.drives << LaptopDrive.new(:cd, 760, writer)
	end

	def add_dvd(writer=false)
		@computer.drives << LaptopDrive.new(:dvd, 4000, writer)
	end

	def add_hard_disk(size_in_mb)
		@computer.drives << LaptopDrive.new(:hard_disk, size_in_mb, true)
	end
end