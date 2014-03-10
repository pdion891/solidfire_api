require 'rest_client'
require 'net/http'
require 'json'

Dir[File.join(File.dirname(__FILE__), 'solidfire_api/*.rb')].sort.each { |lib| require lib }


module SolidfireApi

end    