module Volume
  

  ## 
  # list volumes, return Array of Hash
  #
  # Arguments:
  #   limit: (Integer, default = 1000)
  #
  def volumes_list(limit = 1000)
    api_call = {
      :method => "ListActiveVolumes",
      :params => {
        :startVolumeID => 0,
        :limit => limit
      }
    }
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