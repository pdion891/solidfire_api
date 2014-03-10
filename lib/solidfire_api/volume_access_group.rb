## 
# Volume Access Group api calls
#
module VolumeAccessGroup
  

  ##
  # list VolumeAccessGroups
  # 
  # Arguments:
  #   state: (String, active or deleted, default = active)
  #   limit: (Integer, default = 1000)
  #
  def vag_list(limit = "1000")
    api_call = {
      :method => "ListVolumeAccessGroup",
      :params => {
        :startVolumeAccessVolumeGroupID => 0,
        :limit => 1000
      }
    }
    answer = query_sf(api_call)
    return answer["volumeAccessGroups"]
  end

  ##
  # create VolumeAccessGroup
  # return groupID
  #
  # Arguments:
  #   group_name: (String, name of group)
  #
  def vag_create(group_name)
    api_call = {
      :method => "CreateVolumeAccessGroup",
      :params => {
        :name => group_name,
        :attributes => {}
      }
    }
    answer = query_sf(api_call)
    return answer["volumeAccessGroupID"]
  end
  
  ##
  # Add iSCSI initiator to VolumeAccessGroup
  #
  # Arguments: 
  #   initiator: (String)
  #   group_id: (Integer)
  #
  def vag_add_initiator(initiator, group_id)
    api_call = {
      :method => "AddInitiatorsToVolumeAccessGroup",
      :params => {
        :volumeAccessGroupID => group_id,
        :initiators => [ initiator ]
      }
    }
    answer = query_sf(api_call)
    return answer
  end    

  ##
  # Add Volume to VolumeAccessGroup
  #
  # Arguments: 
  #   volume_id: (Integer)
  #   group_id: (Integer)
  #
  def vag_add_volume(volume_id, group_id)
    api_call = {
      :method => "AddVolumesToVolumeAccessGroup",
      :params => {
        :volumeAccessGroupID => group_id,
        :volumes => [ volume_id ]
      }
    }
    answer = query_sf(api_call)
    return answer
  end   
end