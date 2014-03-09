##
# Cluster
# 
# Cluster related API calls 
#

module Cluster

  ##
  # cluster_state: require administrative account.
  #
  def cluster_state()
    api_call = {
      :method => "GetClusterState",
      :params => {},
      :id => 1
    }
    answer = query_sf(api_call)
    return answer
  end

  ##
  # Cluster Information such as hostname, mvip,svip,...
  #  
  def cluster_info()
    api_call = {
      :method => "GetClusterInfo",
      :params => {
      }
    }
    answer = query_sf(api_call)
    return answer["clusterInfo"]
  end

  ##
  # provide list of disk in a Array of hash.
  #  
  def drives_list()
    api_call = {
      :method => "ListDrives",
      :params => {
      }
    }
    answer = query_sf(api_call)
    return answer["drives"]
  end
  
  ##
  # hard drive performance metric, return in Hash.
  # 
  # Arguments:
  #   drive_id: (Integer)
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
  
  ##
  # List all account, return Array of Hash
  #
  # Arguments:
  #   limit: (integer, default=1000)
  #  
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

