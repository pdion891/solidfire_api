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
  def vag_list()
    api_call = {
      :method => "ListVolumeAccessGroups",
      :params => {}
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
  # Require Admin credential
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
  # Add iSCSI initiator(s) to VolumeAccessGroup
  #
  # Arguments: 
  #   initiator: (String or Array)
  #   group_id: (Integer)
  #
  # Require Admin credential
  #
  def vag_add_initiator(initiator, group_id)
    initiator = [ initiator ] if initiator.class == String
    api_call = {
      :method => "AddInitiatorsToVolumeAccessGroup",
      :params => {
        :volumeAccessGroupID => group_id,
        :initiators => initiator
      }
    }
    answer = query_sf(api_call)
    return answer
  end

  ##
  # Remove iSCSI initiator(s) from VolumeAccessGroup
  #
  # Arguments: 
  #   initiator: (String or Array)
  #   group_id: (Integer)
  #
  # Require Admin credential
  #
  def vag_remove_initiator(initiator, group_id)
    initiator = [ initiator ] if initiator.class == String
    api_call = {
      :method => "RemoveInitiatorsFromVolumeAccessGroup",
      :params => {
        :volumeAccessGroupID => group_id,
        :initiators => initiator
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
  # Require Admin credential
  #
  def vag_add_volume_id(volume_id, group_id)
    volume_id = [ volume_id ] if volume_id.class == String
    api_call = {
      :method => "AddVolumesToVolumeAccessGroup",
      :params => {
        :volumeAccessGroupID => group_id,
        :volumes => volume_id
      }
    }
    answer = query_sf(api_call)
    return answer
  end

  ##
  # Add Volume to VolumeAccessGroup using names
  #
  #
  def vag_add_volume(volume_name, vag_name)
    volume_id = volumes_list(name: volume_name).first["volumeID"]
    vag_id = vag_list().select {|s| s["name"] == vag_name }.first["volumeAccessGroupID"]
    vag_add_volume_id(volume_id, vag_id)
  end

end