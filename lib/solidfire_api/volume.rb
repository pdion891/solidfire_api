module Volume

##
  # list active volumes, return Array of Hash
  #
  # Arguments:
  #   name: (String, Volume name)
  #   accountid: (integer, accountID)
  #   enable512e: (boolean, default = true)
  #   minIOPS: (integer, default = 100)
  #   maxIOPS: (integer, default = 1000)
  #   burstIOPS: (integer, default = 10000)
  #
  def volumes_create(name, accountid, size, enable512e = true, minIOPS = 100, maxIOPS = 1000, burstIOPS = 10000)
    api_call = {
      :method => "CreateVolume",
      :params => {
        :name => name,
        :accountID => accountid,
        :totalSize => size,
        :enable512e => enable512e,
        :qos => {
          :minIOPS => minIOPS,
          :maxIOPS => maxIOPS,
          :burstIOPS => burstIOPS
        }
      }
    }
    answer = query_sf(api_call)
    return answer["volumeID"]
  end

  ##
  # list active volumes, return Array of Hash
  #
  # Arguments:
  #   state: (String, active or deleted, default = active)
  #   startid: (Integer, default = 0)
  #   limit: (Integer, default = 1000)
  #   accountid: (Integer, or Array of accountID)
  #   name: (String, Volume name)
  #
  def volumes_list(options = {})
    state = options.fetch(:state, 'active')
    startid = options.fetch(:startid, 0)
    limit = options.fetch(:limit, 1000)
    accounts = options.fetch(:accountid, nil)
    name = options.fetch(:name, nil)
    
    if name
      api_call = {
        :method => "ListVolumes",
        :params => {
          :VolumeName => name,
          :limit => 1
        }
      }
    elsif accounts
      accounts = [ accounts ] if accounts.class == String || Integer
      api_call = {
        :method => "ListVolumes",
        :params => {
          :accounts => accounts,
          :limit => limit
        }
      }
    else
      api_call = {
        :method => "ListVolumes",
        :params => {
          :VolumeStatus => state,
          :startVolumeID => startid,
          :limit => limit
        }
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
    return answer
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
        :accountID => accountid
      }
    }
    answer = query_sf(api_call)
    return answer
  end


  def volumes_stats_by_account()
    api_call = {
      :method => "ListVolumeStatsByAccount",
      :params => { },
      :id => 1
    }
    answer = query_sf(api_call)
    return answer
  end
end