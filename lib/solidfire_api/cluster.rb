require 'rest_client'
require 'net/http'
require 'json'

def query_sf(query)
  # query is a hash that is post in json format to SolidFire API.
  solidfire_rest_url = "https://#{@solidfire_username}:#{@solidfire_password}@#{@solidfire_mvip}/json-rpc/5.0"
  result = JSON.parse(RestClient.post solidfire_rest_url, query.to_json )
  return result
end

def GetClusterState()
  api_call = {
    :method => "GetClusterState",
    :params => {},
    :id => 1
  }
  answer = query_sf(api_call)
  if answer["error"].nil?
    return answer["error"]["message"]
  else
    return answer[]
  return answer["result"]
end

def ClusterInfo()
  api_call = {
    :method => "GetClusterInfo",
    :params => {
    }
  }
  answer = query_sf(api_call)
  return answer["result"]["clusterInfo"]
end

def ListDrives()
  api_call = {
    :method => "ListDrives",
    :params => {
    }
  }
  answer = query_sf(api_call)
  return answer["result"]["drives"]
end

def GetDriveStats(drive_id)
  api_call = {
    :method => "GetDriveStats",
    :params => {
      :driveID => drive_id
    }
  }
  answer = query_sf(api_call)
  return answer["result"]
end

def ListAccounts(limit = 1000)
  api_call = {
    :method => "ListAccounts",
    :params => {
      :startAccountID => 0,
      :limit => limit
    }
  }
  answer = query_sf(api_call)
  return answer["result"]["accounts"]
end



