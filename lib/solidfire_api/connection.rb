# Load libraries
require 'solidfire_api/volume'
require 'solidfire_api/node'
require 'solidfire_api/cluster'
require 'solidfire_api/volume_access_group'

module SolidfireApi
  
  ##
  # Object connection 
  #
  # Call using:  SolidfireApi::Connection.new({...})
  #
  # Arguments:
  #   mvip: (String)
  #   username: (String)
  #   password: (String)
  # 
  class Connection    
    include Cluster
    include Volume
    include Node
    include VolumeAccessGroup
    
    def self.data
      @data ||= Hash.new do |hash, key|
        hash[key] = {}
      end
    end

    def self.reset
      @data = nil
    end
    
    ##
    # 
    # Used by all other methods to connect at the SolidFire API
    # require RestClient gem to handle Rest API calls.
    # the input is the complete API query as Hash, the method will
    # send the query as json request to the Solidfire API.
    #
    # Example:
    #   >> api_call = {
    #   >>   :method => "GetClusterInfo",
    #   >>   :params => {
    #   >>    }
    #   >> }
    #   >> query_sf(api_call)
    #
    # 
    # Arguments:
    #   query: (Hash)
    #      must include the complete Solidfire API query string.
    def query_sf(query)
      # query is a hash that is post in json format to SolidFire API.
      solidfire_rest_url = "https://#{@username}:#{@password}@#{@mvip}/json-rpc/5.0"
      result = JSON.parse(RestClient.post solidfire_rest_url, query.to_json)
      if result["result"].nil?
        if result["error"].nil?
          return result
        else
          return result["error"]
        end
      else 
        return result["result"]
      end
    end 

    def initialize(options={})
      @mvip = options[:mvip]
      @username = options[:username]
      @password = options[:password]

      api_call = {
        :method => "GetClusterInfo",
        :params => {
        }
      }
      array = query_sf(api_call)
      @name = array["clusterInfo"]["name"]
      @mvip = array["clusterInfo"]["mvip"]
      @svip = array["clusterInfo"]["svip"]
    end

    def name
      @name
    end
    
    def mvip
      @mvip
    end
    
    def svip
      @svip
    end
    
    
  end    
end