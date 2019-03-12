module Adtraction
  module Api
    module Affiliate
      module Programs
        
        def programs(channel_id:, market: nil, approval_status: nil, coupon_marketing: nil, feed: nil, email_marketing: nil, social_marketing: nil, currency: nil, cashback_marketing: nil, sem_marketing: nil, program_id: nil, path: "/affiliate/programs", options: {})
          data              =   {}
          possible_params   =   [:channel_id, :market, :approval_status, :coupon_marketing, :feed, :email_marketing, :social_marketing, :currency, :cashback_marketing, :sem_marketing, :program_id]
          
          possible_params.each do |param|
            value           =   eval("#{param}")
            data[param.to_s.camelize(:lower)] = value unless value.nil?
          end
          
          ::Adtraction::Api::Models::Program.parse(post(path, data: data, options: options)&.body)
        end
        
        def program_info(program_id, path: "/affiliate/programinfo", options: {})
          get("#{path}/#{program_id}", options: options)&.body
        end
      
      end
    end
  end
end
