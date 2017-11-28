# XenditAPI

Ruby HTTP client for [Xendit](https://www.xendit.co/en/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xendit_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xendit_api

## Usage

```ruby
require "xendit_api"

client = XenditAPI.connect("XENDIT_SECRET_KEY")
client.virtual_account.get("57f6fbf26b9f064272622aa6")
```

## API documentation

Please refer to [API documentation](https://xendit.github.io/apireference/) for details.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
