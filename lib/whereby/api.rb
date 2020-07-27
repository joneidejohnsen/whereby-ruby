require 'httparty'
module Whereby
  class WherebyError < StandardError; end

  class Api
    API_VERSION = 'v1'
    BASE_URL = "https://api.whereby.dev/#{API_VERSION}"

    # GET /v1/meetings/:id
    def meeting(id)
      Meeting.new(whereby_request(:get, "meetings/#{id.to_s}"))
    end

    # POST /v1/meetings/
    def create_meeting(options={})
      Meeting.new(whereby_request(:post, "meetings", options))
    end

    # DELETE /v1/meetings/:id
    def delete_meeting(id)
      whereby_request(:delete, "meetings/#{id.to_s}")
    end

    private
    def whereby_request(method, url, options={})
      url = "#{BASE_URL}/#{url}"

      # Convert hash keys into camel case
      options = Hash[options.map { |k,v| [k.to_s.camelize, v]}]

      http_attrs = {headers: headers}
      http_attrs.merge!(options)

      # TODO: Create case/when for special cases for options

      result = HTTParty.send(method, url, http_attrs)

      if [200, 201].include? result.code
        JSON.parse(result.body) # Create / Get
      elsif result.code == 204
        true # Delete
      else
        raise WherebyError.new error(result.code)
      end
    end

    def error(code)
      return "Access token is missing or invalid" if code == 401
      return "The requested resource doesn't exist" if code == 404
      "Major fuck-up."
    end

    def headers
      {
          "Content-type" => "application/json",
          "Authorization" => "Bearer #{Whereby.api_key}"
      }
    end
  end
end