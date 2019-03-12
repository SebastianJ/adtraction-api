module Adtraction
  module Api
    module Constants
      
      TRANSACTION_TYPE_ENUM = {
        2   => :unknown, # Some programs have this value
        3   => :sale,
        4   => :lead,
        31  => :isale, #iSale (post impression Sale)
        41  => :ilead  #iLead (post impression Lead)
      }
      
      APPROVAL_STATUS_ENUM = {
        0 => :rejected,
        1 => :approved,
        2 => :pending_review,
        3 => :not_applied,
      }
      
      EMAIL_MARKETING_ENUM = {
        0 => :not_allowed,
        1 => :allowed,
        2 => :restricted # Preview required
      }
      
      SEM_MARKETING_ENUM = {
        0 => :not_allowed,
        1 => :allowed,
        2 => :restricted # No brand bidding
      }
      
      SOCIAL_MARKETING_ENUM = {
        0 => :not_allowed,
        1 => :allowed
      }
      
      CASHBACK_MARKETING_ENUM = {
        0 => :not_allowed,
        1 => :allowed
      }
      
      COUPON_MARKETING_ENUM = {
        0 => :not_allowed,
        1 => :allowed
      }
      
    end
  end
end
