# Adtraction::Api

Adtraction::Api is a Ruby client to interact with [Adtraction's](https://adtraction.com) [API](https://adtraction.docs.apiary.io/#).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'adtraction-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install adtraction-api

## Usage

First of all you need an Adtraction account in order to get your API key. After you've gotten ahold of your API key, configure the client to use it:

```ruby
Adtraction::Api.configure do |config|
  config.api_key    =   "YOUR_API_KEY"
end
```

If you're using Ruby on Rails, just put this in an initializer e.g. under config/initializers/adtraction_api.rb.

If you're trying to access the API using multiple API keys, then initialize each client with its own separate config:

```ruby
Adtraction::Api::Client.new(configuration: Adtraction::Api::Configuration.new(api_key: "SOME_OTHER_API_KEY"))
```

This project is a WIP and not all endpoints have been implemented. They'll be gradually implemented depending on what I personally need to use from the API.

Feel free to fork and submit your own pull requests if you decide to add more endpoints :)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

Please be aware that removing any of the VCR cassettes under spec/fixtures/vcr_cassettes and re-running the specs might lead to sensitive/personal data being stored in the newly generated cassettes!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SebastianJ/adtraction-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Adtraction::Api project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/SebastianJ/adtraction-api/blob/master/CODE_OF_CONDUCT.md).
