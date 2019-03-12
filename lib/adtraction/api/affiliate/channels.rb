module Adtraction
  module API
    module Affiliate
      module Channels
        
        def approved_channels(path: "/affiliate/approvedchannels", options: {})
          ::Adtraction::API::Models::Channel.parse(get(path, options: options)&.body)
        end
      
      end
    end
  end
end
