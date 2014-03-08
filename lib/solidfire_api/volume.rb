module Volume
  
  def VolumeList(limit = 1000)
    api_call = {
      :method => "ListActiveVolumes",
      :params => {
        :startVolumeID => 0,
        :limit => limit
      }
    }
    answer = query_sf(api_call)
    return answer["result"]["volumes"]
  end
  
  def VolumeStats(vol_id)
    api_call = {
      :method => "GetVolumeStats",
      :params => {
        :volumeID => vol_id
      }
    }
    answer = query_sf(api_call)
    return answer["result"]["volumeStats"]
  end
  
  def VolumeForAccount(accountid)
    api_call = {
      :method => "ListVolumesForAccount",
      :params => {
        :volumeID => accountid
      }
    }
    answer = query_sf(api_call)
    return answer["result"]
  end 
  
  def ListVolumeStatsByAccount()
    api_call = {
      :method => "ListVolumeStatsByAccount",
      :params => { },
      :id => 1
    }
    answer = query_sf(api_call)
    return answer["result"]
  end 
end