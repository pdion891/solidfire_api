module Volume
  
## 
  # list active volumes, return Array of Hash
  #
  # Arguments:
  #   state: (String, active or deleted, default = active)
  #   limit: (Integer, default = 1000)
  #
  def volumes_create()
    api_call = {
      :method => "CreateVolume",
      :params => {
        :startVolumeID => 0,
        :limit => limit
      }
    }
    answer = query_sf(api_call)
    return answer["volumes"]
  end

  ## 
  # list active volumes, return Array of Hash
  #
  # Arguments:
  #   state: (String, active or deleted, default = active)
  #   limit: (Integer, default = 1000)
  #
  def volumes_list(state = "active", limit = "1000")
    case state
    when "active"
      api_call = {
        :method => "ListActiveVolumes",
        :params => {
          :startVolumeID => 0,
          :limit => limit
        }
      }
    when "deleted"
      api_call = {
        :method => "ListDeletedVolumes",
        :params => {}
      }
    end
    answer = query_sf(api_call)
    return answer["volumes"]
  end
  
  ##
  # return volume performance metrics as Hash
  #
  # Arguments:
  #  vol_id: (Integer)
  #      Volume ID from the Solidfire Cluster.
  #
  def volume_stats(vol_id)
    api_call = {
      :method => "GetVolumeStats",
      :params => {
        :volumeID => vol_id
      }
    }
    answer = query_sf(api_call)
    return answer["volumeStats"]
  end

  ##
  # return volume performance metrics as Hash
  #
  # Arguments:
  #  vol_id: (Integer)
  #      Volume ID from the Solidfire Cluster.
  #
  def volume_efficiency(vol_id)
    api_call = {
      :method => "GetVolumeEfficiency",
      :params => {
        :volumeID => vol_id
      }
    }
    answer = query_sf(api_call)
    return answer["result"]
  end
    
  ##
  # Return volumes list per account
  # 
  # Arguments:
  #   accountid: (Integer)
  # 
  def volumes_for_account(accountid)
    api_call = {
      :method => "ListVolumesForAccount",
      :params => {
        :volumeID => accountid
      }
    }
    answer = query_sf(api_call)
    return answer["result"]
  end 
  
  
  def volumes_stats_by_account()
    api_call = {
      :method => "ListVolumeStatsByAccount",
      :params => { },
      :id => 1
    }
    answer = query_sf(api_call)
    return answer["result"]
  end 
end