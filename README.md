# Whereby Ruby HTTP API Wrapper

This gem is a very simple [Whereby](https://whereby.com) HTTP API wrapper written for Ruby/Rails projects, to easly create video meetings and conferences. 

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

If using Rails put the following into an initializer. If you use plain Ruby, run this code before trying to use the API.

```ruby
require 'whereby'
Whereby.configure do |config|
  config.api_key = ENV['YOUR_KEY']
end
```

### Instantiate an API object

```ruby
api = Whereby::Api.new
```

### API Requests

```ruby
api.meeting(id)                     # GET     /v1/meetings/:id             
api.create_meeting(options)         # POST    /v1/meetings
api.delete_meeting(id)              # DELETE  /v1/meetings/:id
```
Read more about the different endpoints and options at https://whereby.dev/http-api/

### Example creating a meeting
```ruby
api.create_meeting(room_name_prefix: '/example', room_mode: "normal", start_date: "2020-08-01T00:00:00Z", end_date: "2020-08-01T15:00:00Z", fields: ["hostRoomUrl"])
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/poption/whereby-ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Whereby Ruby HTTP API project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/whereby-ruby/blob/master/CODE_OF_CONDUCT.md).
