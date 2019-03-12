require "faraday"
require "faraday_middleware"
require "virtus"

require "adtraction/api/version"
require "adtraction/api/configuration"
require "adtraction/api/constants"

require "adtraction/api/models/channel"
require "adtraction/api/models/program"

require "adtraction/api/affiliate/channels"
require "adtraction/api/affiliate/programs"

require "adtraction/api/client"

if !String.instance_methods(false).include?(:camelize)
  require "adtraction/api/extensions/string"
end

module Adtraction
  module API
    
    class << self
      attr_writer :configuration
    end
  
    def self.configuration
      @configuration ||= ::Adtraction::API::Configuration.new
    end

    def self.reset
      @configuration = ::Adtraction::API::Configuration.new
    end

    def self.configure
      yield(configuration)
    end
    
    class Error < StandardError; end
    class InvalidApiKeyError < Error; end
  end
end
