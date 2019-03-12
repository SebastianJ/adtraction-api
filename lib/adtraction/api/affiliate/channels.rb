module Adtraction
  module Api
    module Affiliate
      module Channels
        
        def approved_channels(path: "/affiliate/approvedchannels", options: {})
          ::Adtraction::Api::Models::Channel.parse(get(path, options: options)&.body)
        end
      
      end
    end
  end
end
