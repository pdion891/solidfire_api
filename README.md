# SolidfireApi

Ruby Gem Accessing Solidfire storage Array API to collect stats. Currently support Simple Authentication.

## Installation

Add this line to your application's Gemfile:

    gem 'solidfire_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install solidfire_api

## Usage
  
  require 'solidfire_api'
  a = SolidfireApi::Connection.new({
    :mvip => "192.168.0.1",
    :username => "monitor",
    :password =>  "patate"
  })
  a.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/solidfire_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
