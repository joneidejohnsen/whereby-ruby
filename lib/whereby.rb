require 'whereby/version'
require 'whereby/api'

module Whereby
  class << self
    attr_accessor :configuration
  end

  def self.api_key
    configuration.api_key
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end


end