# Use the proxy pattern when we want to solve the following problems:
# => Controlling access to an object (the_protection_proxy.rb),
# => Providing a location-independent way of getting the object (remote_proxies.rb), or
# => Delaying an objects creation (virtual_proxies_make_you_lazy.rb).

# A proxy is an impostor object.  The real object is referred to as the subject.
# When a client asks for an object (the subject), we give them back the proxy.
# When the client code calls a method on the proxy, the proxy will forward the request
# to the subject.