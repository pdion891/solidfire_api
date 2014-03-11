##
# Node
# 
# API call related to cluster nodes
#
module Node
  
  ##
  #
  # List cluster nodes
  # 
  # Arguments:
  # 
  #  state: (String, default = active)
  #       active
  #       all
  def nodes_list(state = "active")
    case state
    when "all"
      api_call = {
        :method => "ListAllNodes",
        :params => {}
      }
    when "active"
      api_call = {
        :method => "ListActiveNodes",
        :params => {}
      }
    end
    answer = query_sf(api_call)
    return answer["nodes"]
  end  
  ##
  # node performance metrics
  #
  # Arguments:
  #   node_id: (Integer)
  #
  def node_stats(node_id)
    api_call = {
      :method => "GetNodeStats",
      :params => {
        :nodeID => node_id
      }
    }
    answer = query_sf(api_call)
    return answer["nodeStats"]
  end

  ##
  # node Hardware info
  #
  # Arguments:
  #   node_id: (Integer)
  #
  def node_stats(node_id)
    api_call = {
      :method => "GetNodeHardwareInfo",
      :params => {
        :nodeID => node_id
      }
    }
    answer = query_sf(api_call)
    return answer["nodeHardwareInfo"]
  end
  
  ##
  # provide list of disks in a Array of hash.
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
  #
  def drive_stats(drive_id)
    api_call = {
      :method => "GetDriveStats",
      :params => {
        :driveID => drive_id
      }
    }
    answer = query_sf(api_call)
    return answer["driveStats"]
  end
  
  
end