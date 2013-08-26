# Allows us to create objects without specifying the class of the object that will be created.

# Solves the problem of which class to use by pushing the decision down on a subclass

# Made up of:
# => Creators; the base and concrete classes that contain the factory methods
# => Products; the objects that are being created.

# In the Pond example the Pond class is the creator, 
# the specific types of ponds (DuckPond, FrogPond) are the concrete creators,
# the products are the Duck and Pond classes.

# Parameterized factory methods slim down the code because we only need to
# each subclass only needs to define one factory method.

# An object dedicated to creating a compatible set of objects is called
# an abstract factory.

# An ordinary class object can create one type of object, an instance of its self.
# An abstract factory can create several diffent types of objects, its products.