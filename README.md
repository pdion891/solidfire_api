# SolidfireApi

Ruby Gem to connect on Solidfire storage Array API to collect stats. Currently support Simple Authentication and very basic functionalities.

Use gem: RestClient to interract with Solidfire API. 

## Installation

Install it:

    $ gem install solidfire_api
    $ irb
    > require 'solidfire_api'
    

## Usage

```ruby
  require 'solidfire_api'
  my_sf = SolidfireApi::Connection.new({
    :mvip => "192.168.0.1",
    :username => "monitor",
    :password =>  "patate"
  })

  # Some method examples:
  my_sf.name
  my_sf.mvip
  my_sf.svip
  my_sf.volumes_list
  
```

Currently supporting volumes and cluster listing and stats API call's to collect performance metrics for monitoring usage. Nothing for managing cluster yet.


## Contributing

1. Fork it ( http://github.com/pdion891/solidfire_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
