module Adtraction
  module API
    class Configuration
      attr_accessor :host, :api_version, :api_key, :faraday
    
      def initialize(host: "api.adtraction.com", api_version: 1, api_key: nil)
        self.host             =   host
        self.api_version      =   api_version
        self.api_key          =   api_key
      
        self.faraday          =   {
          adapter:    :net_http,
          user_agent: "Adtraction Ruby Client #{::Adtraction::API::VERSION}",
          verbose:    false
        }
      end
    
      def verbose_faraday?
        self.faraday.fetch(:verbose, false)
      end
    
    end
  end
end
