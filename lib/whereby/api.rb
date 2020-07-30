require 'httparty'
require 'json'

module Whereby
  class WherebyError < StandardError; end

  class Api
    API_VERSION = 'v1'.freeze
    BASE_URL = "https://api.whereby.dev/#{API_VERSION}".freeze

    # GET /v1/meetings/:id
    def meeting(id)
      Meeting.new(whereby_request(:get, "meetings/#{id}"))
    end

    # POST /v1/meetings/
    def create_meeting(**options)
      Meeting.new(whereby_request(:post, 'meetings', options))
    end

    # DELETE /v1/meetings/:id
    def delete_meeting(id)
      whereby_request(:delete, "meetings/#{id}")
    end

    private

    def whereby_request(method, url, options = {})
      url = "#{BASE_URL}/#{url}"
      result = HTTParty.send(method, url, { headers: headers, body: body(options) })

      if [200, 201].include? result.code
        JSON.parse(result.body)
      elsif result.code == 204
        true
      else
        raise WherebyError.new error(result.code)
      end
    end

    def body(options)
      Hash[options.map { |k, v| [k.to_s.whereby_lower_camelize, v] }].to_json
    end

    def headers
      {
          'Content-type' => 'application/json',
          'Authorization' => "Bearer #{Whereby.api_key}"
      }
    end

    def error(code)
      return 'Access token is missing or invalid' if code == 401
      return 'The requested resource does not exist' if code == 404

      "The API resulted in an unknown status code: #{code}"
    end

  end
end