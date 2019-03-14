module Adtraction
  module Api
    module Models
      
      class Program
        include Virtus.model
        
        attribute :id,                                Integer
        attribute :channel_id,                        Integer
        attribute :market,                            String
        attribute :currency,                          String

        attribute :name,                              String
        attribute :url,                               String
        attribute :tracking_url,                      String
        attribute :ad_id,                             Integer
        attribute :logo_url,                          String
        attribute :category,                          String
        
        attribute :approval_status,                   Symbol
        attribute :feed,                              Boolean
        attribute :sem_marketing,                     Symbol
        attribute :social_marketing,                  Symbol
        attribute :email_marketing,                   Symbol
        attribute :cashback_marketing,                Symbol
        attribute :coupon_marketing,                  Symbol
        
        attribute :current_segment,                   String
        attribute :pending_active,                    Boolean
        attribute :cookie_duration,                   Integer

        attribute :compensations,                     Array
        
        def self.parse(data)
          programs      =     []
          
          mappings      =     {
            "channelId"       =>  :channel_id,
            "programId"       =>  :id,
            "market"          =>  :market,
            "currency"        =>  :currency,
            "feed"            =>  :feed,
            "programName"     =>  :name,
            "programURL"      =>  :url,
            "currentSegment"  =>  :current_segment,
            "pendingActive"   =>  :pending_active,
            "cookieDuration"  =>  :cookie_duration,
            "adId"            =>  :ad_id,
            "compensations"   =>  :compensations,
            "logoURL"         =>  :logo_url,
            "trackingURL"     =>  :tracking_url,
            "category"        =>  :category
          }
          
          data.each do |item|
            program      =   self.new
            
            mappings.each do |api_column, column|
              program.send("#{column}=", item.fetch(api_column, nil))
            end
            
            program.approval_status     =   Adtraction::Api::Constants::APPROVAL_STATUS_ENUM.fetch(item.fetch("approvalStatus"))
            program.email_marketing     =   Adtraction::Api::Constants::EMAIL_MARKETING_ENUM.fetch(item.fetch("emailMarketing"))
            program.sem_marketing       =   Adtraction::Api::Constants::SEM_MARKETING_ENUM.fetch(item.fetch("semMarketing"))
            program.social_marketing    =   Adtraction::Api::Constants::SOCIAL_MARKETING_ENUM.fetch(item.fetch("socialMarketing"))
            program.cashback_marketing  =   Adtraction::Api::Constants::CASHBACK_MARKETING_ENUM.fetch(item.fetch("cashbackMarketing"))
            program.coupon_marketing    =   Adtraction::Api::Constants::COUPON_MARKETING_ENUM.fetch(item.fetch("couponMarketing"))
            
            program.compensations&.each do |compensation|
              enum                      =   Adtraction::Api::Constants::TRANSACTION_TYPE_ENUM.fetch(compensation["transactionType"], :unknown)
              compensation["transactionType"]   =   enum unless enum.nil?
            end
            
            programs << program
          end
          
          return programs
        end
        
      end
      
    end
  end
end
