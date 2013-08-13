# We need to provide a location-independent way of getting an object.

# In this example, Olsen uses the Ruby SOAP client mechanism to create a proxy
# for a public SOAP service that provides weather information.

require 'soap/wsdlDriver'

wsdl_url = 'http://www.webservicex.net/WeatherForcast.asmx?WSDL'

proxy = SOAP::WSDLDriverFactory.new(wsdl_url).create_rpc_driver

weather_info = proxy.GetWeatherByZipCode('ZipCode'=>'90210')