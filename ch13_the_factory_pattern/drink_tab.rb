# Can solve the problem of which class to use by using a subclass:

class Tab
  def initialize(number_drinks)
    @drinks = []
    number_drinks.times do |i|
      drink = new_drink("Drink #{i}")
      @drinks << drink
    end
  end

  def simulate_one_round
    @drinks.each {|drink| drink.order}
    @drinks.each {|drink| drink.consume}
    @drinks.each {|drink| drink.pay}
  end
end

class Alcoholic
  def initialize(name)
    @name = name
  end

  def order
    puts("I ordered a #{name}.")
  end

  def consume
    puts("I'm drinking a #{name}!")
  end

  def pay
    puts("I've closed out my tab for the #{name}.")
  end
end

class NonAlcoholic
  def initialize(name)
    @name = name
  end

  def modify
    puts("Can we add some vodka to this #{name}?")
  end
end

# We can build two subclasses of Tab; one for alcoholic drinks and one for non-alcoholic drinks

class AlcoholicTab < Tab
  def new_drink(name)
    Alcoholic.new(name)
  end
end

class NonAlcoholicTab < Tab
  def new_drink(name)
    NonAlcoholic.new(name)
  end
end

# Now we can fill each instance with the correct drinks:

sunday_funday = AlcoholicTab.new(3)
sunday_funday.simulate_one_round

manic_monday = NonAlcoholicTab.new(3)
manic_monday.simulate_one_round

# We can use the parameterized factory method here:

class Tab
  def initialize(number_non_alcoholic_drinks, number_alcoholic_drinks)
    @non_alcoholic_drinks = []
    number_non_alcoholic_drinks.times do |i|
      non_alcoholic_drink = new_order(:non_alcoholic, "Non Alcoholic Drink #{i}")
      @non_alcoholic_drinks << non_alcoholic_drink
    end

    @alcoholic_drinks = []
    number_alcoholic_drinks.times do |i|
      alcoholic_drink = new_order(:alcoholic, "Alcoholic Drink #{i}")
      @alcoholic_drinks << alcoholic_drink
    end
  end

  def simulate_one_round
    @non_alcoholic_drinks.each {|drink| drink.modify}
    @alcoholic_drinks.each {|drink| drink.order}
    @alcoholic_drinks.each {|drink| drink.consume}
    @alcoholic_drinks.each {|drink| drink.pay}
  end
end

# Lets say we want to add beverage choices.  We can create various classes:

class Beer
  def initialize(name)
    @name = name
  end

  def pour_from_tap
    puts("I'm pouring the #{@name} beer.")
  end
end

# And then put it all together:

class Drink < Tab
  def new_order(type, name)
    if type == :non_alcoholic
      NonAlcoholic.new(name)
    elsif type == :alcoholic
      Beer.new(name)
    else 
      raise "Unknown drink type: #{type}"
    end
  end
end

# We can get rid of the hierarchy of Tab subclasses
# by storing the classes of objects that we want to create
# in instance variables:

class Tab
  def initialize(number_non_alcoholic_drinks, non_alcoholic_class
                 number_alcoholic_drinks, alcoholic_class)

    @non_alcoholic_class = non_alcoholic_class
    @alcoholic_class = alcoholic_class

    @non_alcoholic_drinks = []
    number_non_alcoholic_drinks.times do |i|
      non_alcoholic_drink = new_order(:non_alcoholic, "Non Alcoholic Drink #{i}")
      @non_alcoholic_drinks << non_alcoholic_drink
    end

    @alcoholic_drinks = []
    number_alcoholic_drinks.times do |i|
      alcoholic_drink = new_order(:alcoholic, "Alcoholic Drink #{i}")
      @alcoholic_drinks << alcoholic_drink
    end
  end

  def simulate_one_round
    @non_alcoholic_drinks.each {|drink| drink.modify}
    @alcoholic_drinks.each {|drink| drink.order}
    @alcoholic_drinks.each {|drink| drink.consume}
    @alcoholic_drinks.each {|drink| drink.pay}
  end

  def new_order(type, name)
    if type == :non_alcoholic
      @non_alcoholic_class.new(name)
    elsif type == :alcoholic
      @alcoholic_class.new(name)
    else 
      raise "Unknown drink type: #{type}"
    end
  end
end

friday = Tab.new(3, NonAlcoholic, 2, Alcoholic)
friday.simulate_one_round

# Lets say we had tabs at multiple venues.  One serves beer and one serves wine.
# We can create a compatible set for each using a factory:

class Wine
  def initialize(name)
    @name = name
  end

  def pour_from_bottle
    puts("I'm pouring the #{@name} wine.")
  end
end

class Water
  #some code
end

class OrangeJuice
  #some code
end


class BrewpubTabFactory
  def new_non_alcoholic_drink(name)
    NonAlcoholic.new
  end

  def new_alcoholic_drink(name)
    Beer.new
  end
end

class WineBarFactory
  def new_non_alcoholic_drink(name)
    NonAlcoholic.new
  end

  def new_alcoholic_drink(name)
    Wine.new
  end
end

class Tab
  def initialize(number_non_alcoholic_drinks, number_alcoholic_drinks,
                 venue_factory)
    @venue_factory = venue_factory

    @non_alcoholic_drinks = []
    number_non_alcoholic_drinks.times do |i|
      non_alcoholic_drink = new_order(:non_alcoholic, "Non Alcoholic Drink #{i}")
      @non_alcoholic_drinks << non_alcoholic_drink
    end

    @alcoholic_drinks = []
    number_alcoholic_drinks.times do |i|
      alcoholic_drink = new_order(:alcoholic, "Alcoholic Drink #{i}")
      @alcoholic_drinks << alcoholic_drink
    end
  end

  def simulate_one_round
    @non_alcoholic_drinks.each {|drink| drink.modify}
    @alcoholic_drinks.each {|drink| drink.order}
    @alcoholic_drinks.each {|drink| drink.consume}
    @alcoholic_drinks.each {|drink| drink.pay}
  end
end

beer_day = Tab.new(2, 4, BrewpubTabFactory.new)
beer_day.simulate_one_round

wine_day = Tab.new(2, 4, WineBarFactory.new)
wine_day.simulate_one_round

# Instead of having several different abstract factory classes,
# we can have just one factory class that stores the class objects of the 
# things it needs to produce:

class DrinkFactory
  def initialize(non_alcoholic_class, alcoholic_class)
    @non_alcoholic_class = non_alcoholic_class
    @alcoholic_class = alcoholic_class
  end

  def non_alcoholic_drink(name)
    @non_alcoholic_drink.new(name)
  end

  def alcoholic_drink(name)
    @alcoholic_drink.new(name)
  end
end

beer_factory = DrinkFactory.new(OrangeJuice, Beer)

wine_factory = DrinkFactory.new(Water, Wine)

beer_day = Tab.new(1, 2, beer_factory)
beer_day.simulate_one_round

wine_day = Tab.new(1, 2, wine_factory)
wine_factory.simulate_one_round