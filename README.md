# SolidfireApi

Ruby Gem to connect on [Solidfire](http://www.solidfire.com/) storage Array API to collect stats. Currently support Simple Authentication and very basic functionalities. Work with API version 8 of SolidFire.

Currently supporting volumes, cluster and disks listing and stats API call's to collect performance metrics for monitoring usage. Nothing for managing cluster yet.

Creation of VolumeAccessGroup, map volumes and iSCSI initiator. 

Use gem: RestClient to interract with Solidfire API. 

## Installation

Gems requirements:

* rest_client
* net/http
* json 

Install it:

    $ gem install solidfire_api
    $ irb
    > require 'solidfire_api'
    

## Usage

### Get some cluster informations

```ruby
  require 'solidfire_api'
  my_sf = SolidfireApi::Connection.new({
    :mvip => "192.168.0.1",
    :username => "monitor",
    :password =>  "patate",
    :verify_ssl => true
  })

  # Some method examples:
  my_sf.name
  my_sf.mvip
  my_sf.svip
  my_sf.volumes_list
  
```


### Map Volume to a Volume Access Group

If you don't want to use CHAP authentication for iSCSI LUN access from initiator, you have to attach Volume to Volume Access Group that include iSCSI initiators.

Administrator privileges required.

```ruby
  require 'solidfire_api'
  my_sf = SolidfireApi::Connection.new({
    :mvip => "192.168.0.1",
    :username => "admin",
    :password =>  "admin_password"
  })
  
  my_sf.vag_add_volume("volumename", "group_name")
   => {}

```

## Contributing

1. Fork it ( http://github.com/pdion891/solidfire_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Todo

* Everything else