# Use when we need to vary the responsibilities of an object.

# Allows us to :
# => easily enhance an existing object
# => layer features atop one another 

# We call it the decorator pattern because we create a new object to 'decorate' another

# The concrete component is the 'real' object that implements basic functionality.
# The decorator class has a reference to a component and implements all the methods of the component type.

# The decorator incorporates a lot of delegation.  We can fix this by using the
# forwardable module.

# Dynamic alternatives to the decorator include:
# => wrapping methods and
# => decorating with modules