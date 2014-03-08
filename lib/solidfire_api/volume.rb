module Volume
  
  def volumeslist(limit = 1000)
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
  
  def volumestats(vol_id)
    api_call = {
      :method => "GetVolumeStats",
      :params => {
        :volumeID => vol_id
      }
    }
    answer = query_sf(api_call)
    return answer["volumeStats"]
  end
  
  def volumesforaccount(accountid)
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