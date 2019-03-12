module Adtraction
  module Api
    class Client
      attr_accessor :configuration
    
      def initialize(configuration: ::Adtraction::Api.configuration)
        self.configuration    =   configuration        
        raise InvalidApiKeyError, "You need to supply a valid API key!" if self.configuration.api_key.to_s.empty?
      end
      
      include Adtraction::Api::Affiliate::Channels
      include Adtraction::Api::Affiliate::Programs
    
      def to_uri(path)
        path                  =   path.gsub(/^\//i, "")
        path                 =~   /^http(s)?:\/\// ? path : "https://#{self.configuration.host}/v#{self.configuration.api_version}/#{path}"
      end
    
      def get(path, params: {}, headers: {}, options: {})
        request path, method: :get, params: params, headers: headers, options: options
      end

      def post(path, params: {}, data: {}, headers: {}, options: {})
        request path, method: :post, params: params, data: data, headers: {}, options: options
      end
    
      def patch(path, params: {}, data: {}, headers: {}, options: {})
        request path, method: :patch, params: params, data: data, headers: {}, options: options
      end
      
      def head(path, headers: {}, options: {})
        request path, method: :head, headers: headers, options: options
      end

      def request(path, method: :get, params: {}, data: {}, headers: {}, options: {})
        headers               =   {
          "X-Token"       =>  self.configuration.api_key,
          "User-Agent"    =>  self.configuration.faraday.fetch(:user_agent, "Adtraction Ruby Client #{::Adtraction::Api::VERSION}"),
          "Content-Type"  =>  "application/json"
        }.merge(headers)
        
        connection            =   Faraday.new(url: to_uri(path)) do |builder|
          builder.response :logger if self.configuration.verbose_faraday?
          
          builder.headers     =   headers
          builder.response :json
          
          yield builder if block_given?
          
          builder.adapter self.configuration.faraday.fetch(:adapter, :net_http)
        end

        response              =   case method
          when :get
            connection.get do |request|
              request.params  =   params if params && !params.empty?
            end
          when :post, :patch
            connection.send(method) do |request|
              request.body    =   data.to_json if data && !data.empty?
              request.params  =   params if params && !params.empty?
            end
          when :head
            connection.send(method)
        end
        
        return response
      end
      
      def log(message)
        puts "[Adtraction::Api::Client] - #{Time.now}: #{message}" if !message.to_s.empty? && self.verbose
      end
    
    end
  end
end
