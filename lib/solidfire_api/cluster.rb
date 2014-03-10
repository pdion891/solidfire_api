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
  # Cluster firmware version including nodes
  #
  def cluster_version()
    api_call = {
      :method => "GetClusterVersionInfo",
      :params => {
      }
    }
    answer = query_sf(api_call)
    return answer["clusterVersion"]
  end  
  ##
  # Cluster performance metrics, overall IOPS,..
  #  
  def cluster_stats()
    api_call = {
      :method => "GetClusterStats",
      :params => {
      }
    }
    answer = query_sf(api_call)
    return answer["clusterStats"]
  end  

  ##
  # Cluster capacity 
  #
  def cluster_capacity()
    api_call = {
      :method => "GetClusterCapacity",
      :params => {
      }
    }
    answer = query_sf(api_call)["clusterCapacity"]
    
    # thinProvisioningFactor metric, calculated based on document instructions.
    # if condition to avoid divide by 0.
    if answer["nonZeroBlocks"] == 0
      answer["thinProvisioningFactor"] = 0
    else
      answer["thinProvisioningFactor"] = (answer["nonZeroBlocks"] + answer["zeroBlocks"]) / answer["nonZeroBlocks"]
    end
    
    # deDuplicationFactor metric, calculated based on document instructions.
    # if condition to avoid divide by 0.
    if answer["uniqueBlocks"] == 0
      answer["deDuplicationFactor"] = 0
    else
      answer["deDuplicationFactor"] = answer["nonZeroBlocks"] / answer["uniqueBlocks"]
    end
    
    # compressionFactor metric, calculated based on document instructions.
    # if condition to avoid divide by 0.
    if answer["uniqueBlocksUsedSpace"] == 0
      answer["compressionFactor"] = 0
    else
      answer["compressionFactor"] = (answer["uniqueBlocks"] * 4096) / answer["uniqueBlocksUsedSpace"]
    end
    
    # efficiencyFactor metric, calculated based on document instructions.
    # efficiencyFactor = thinProvisioningFactor * deDuplicationFactor * compressionFactor
    answer["efficiencyFactor"] = answer["thinProvisioningFactor"] * answer["deDuplicationFactor"] * answer["compressionFactor"]
    
    return answer
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

  ##
  # List Cluster Faults
  # 
  # Arguments:
  #  fault_type: (node,drive,cluster,service, default=all)
  #       node: Fault affecting an entire node
  #       drive: Fault affecting an individual drive
  #       cluster: Fault affecting the entire cluster
  #       service: Fault affecting a service on the cluster
  def faults_list(fault_type = "all")
    api_call = {
      :method => "ListClusterFaults",
      :params => {
        :faultTypes => fault_type
      }
    }
    answer = query_sf(api_call)
    return answer["faults"]
  end

end

