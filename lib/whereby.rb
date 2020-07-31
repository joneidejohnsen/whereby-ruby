require 'whereby/configuration'
require 'whereby/version'
require 'whereby/element'
require 'whereby/meeting'
require 'whereby/api'

module Whereby
  class << self
    attr_writer :configuration
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

class String
  def whereby_underscore
    gsub(/::/, '/')
      .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
      .gsub(/([a-z\d])([A-Z])/,'\1_\2')
      .tr('-', '_')
      .downcase
  end

  def whereby_camelize
    split('_').collect(&:capitalize).join
  end

  def whereby_lower_camelize
    res = whereby_camelize
    res[0].downcase + res[1..-1]
  end
end