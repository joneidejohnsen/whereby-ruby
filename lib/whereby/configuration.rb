module Whereby
  class Configuration
    attr_accessor :api_key

    def initialize
      @api_key = ENV["WHEREBY_API_KEY"]
    end
  end
end