module SolidfireApi
  
  class Connection    
    #include Cluster
    include Volume
    
    def self.data
      @data ||= Hash.new do |hash, key|
        hash[key] = {}
      end
    end

    def self.reset
      @data = nil
    end
    
    def initialize(options={})
      @mvip = options[:mvip]
      @username = options[:username]
      @password = options[:password]
    end
    
    def query_sf(query)
      # query is a hash that is post in json format to SolidFire API.
      solidfire_rest_url = "https://#{@username}:#{@password}@#{@mvip}/json-rpc/5.0"
      result = JSON.parse(RestClient.post solidfire_rest_url, query.to_json )
      return result
    end 
  end
      
end