

module Cluster

  def cluster_state()
    api_call = {
      :method => "GetClusterState",
      :params => {},
      :id => 1
    }
    answer = query_sf(api_call)
    return answer
  end
  
  def cluster_info()
    api_call = {
      :method => "GetClusterInfo",
      :params => {
      }
    }
    answer = query_sf(api_call)
    return answer["clusterInfo"]
  end
  
  def drives_list()
    api_call = {
      :method => "ListDrives",
      :params => {
      }
    }
    answer = query_sf(api_call)
    return answer["drives"]
  end
  
  def drive_stats(drive_id)
    api_call = {
      :method => "GetDriveStats",
      :params => {
        :driveID => drive_id
      }
    }
    answer = query_sf(api_call)
    return answer["result"]
  end
  
  def accounts_list(limit = 1000)
    api_call = {
      :method => "ListAccounts",
      :params => {
        :startAccountID => 0,
        :limit => limit
      }
    }
    answer = query_sf(api_call)
    return answer["accounts"]
  end

end

