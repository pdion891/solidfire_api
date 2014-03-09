# SolidfireApi

Ruby Gem to connect on Solidfire storage Array API to collect stats. Currently support Simple Authentication and very basic functionality.

## Installation

Install it yourself as:

    $ gem install solidfire_api
    $ irb
    > require 'solidfire_api'
    

## Usage

```ruby
  require 'solidfire_api'
  a = SolidfireApi::Connection.new({
    :mvip => "192.168.0.1",
    :username => "monitor",
    :password =>  "patate"
  })
  a.name
  a.mvip
  a.svip
  a.volumes_list
  
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/solidfire_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
