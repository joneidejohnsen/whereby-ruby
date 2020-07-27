# Whereby Ruby HTTP API Wrapper

Just a simple Whereby HTTP API wrapper written for Ruby projects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'whereby-ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install whereby-ruby

## Usage

If using Rails put the following into a initializer. If just Ruby, run this before trying to use the API.

```ruby
require 'whereby'
Whereby.configure do |config|
  config.api_key = 'YOUR_KEY_HERE'
end
```

### Instantiate an API object.

```ruby
api = Whereby::Api.new
```

### API Requests

```ruby
api.meeting(id)                     # GET     /v1/meetings/:id             
api.create_meeting(options)         # POST    /v1/meetings
api.delete_meeting(id)              # DELETE  /v1/meetings/:id
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/poption/whereby-ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Whereby Ruby HTTP API project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/whereby-ruby/blob/master/CODE_OF_CONDUCT.md).
