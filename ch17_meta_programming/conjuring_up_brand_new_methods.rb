# Olsen gives us new requirements for the
# habitat simulator.  We must be able to
# model populations of plants and animals.
# Olsen wants us to:
# => Group together all living things by area
# => Keep track of their biological classifications

# We can extract the common aspects of these two problems

# First, Olsen gives us two instances of Tiger and Tree classes.  They
# are both leaf nodes of two different composites; 
# one that tracks the geographic population and another that tracks the
# biological classifications.

class Tiger < CompositeBase
  member_of(:population)
  member_of(:classification)

  # Lots of code omitted...
end

class Tree < CompositeBase
  member_of(:population)
  member_of(:classification)

  # Lots of code omitted...
end

# Also the classes that represent populations and species are
# composites.

class Jungle < CompositeBase
  composite_of(:population)

  # Omitted code
end

class Species < CompositeBase
  composite_of(:classification)

  # Omitted code
end

tony_tiger = Tiger.new('tony')
se_jungle = Jungle.new('southeastern jungle tigers')
se_jungle.add_sub_population(tony_tiger)

tony_tiger.parent_population # => southeastern jungle

species = Species.new('P.tigris')
species.add_sub_classification(tony_tiger)

tony_tiger.parent_classigication # => 'P.tigris'

# Here is the composite base class:

class CompositeBase
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.member_of(composite_name)
    code = %Q{
      attr_accessor :parent_#{composite_name}
    }
    class_eval(code)
  end

  def self.composite_of(composite_name)
    member_of composite_name
    code %Q{
      def sub_#{composite_name}s 
        @sub_#{composite_name}s = [] unless @sub_#{composite_site_name}s
        @sub_#{composite_name}s

        def add_sub_#{composite_name}(child)
          return if sub_#{composite_name}s.include?(child)
          sub_#{composite_name}s << child
          child.parent_#{composite_name} = self
        end

        def delete_sub_#{composite_name}(child)
          return unless sub_#{composite_name}s.delete(child)
          child.parent_#{composite_name} = nil
        end
    }
    class_eval(code)
  end
end






