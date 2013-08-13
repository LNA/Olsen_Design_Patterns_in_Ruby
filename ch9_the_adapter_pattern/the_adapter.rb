# Allows us to bridge the gap between mismatching software interfaces.

# Exists to soak up the differences between the interfaces that we need and the objects that we have.

# Supports the interface that we need on the outside, but implements that interface by making calls to an object 
# hidden inside another object that does everything we need it to do via the wrong interface.

# Ruby allows us to modify the object with the wrong interface at runtime so that it has the right interface.
# However if the object is complex or you don't understand it fully, use the classic adapter.

# In this pattern, one object stands for another.  Will see the same in proxies and decorators.

# An adapter is an adapter only if you are stuck with objects that have the wrong interface and you are trying to
# keep the pain of dealing with these ill-fitting interfaces from spreading throughout your system.