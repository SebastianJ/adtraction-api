module Adtraction
  module Api
    module Models
      
      class Channel
        include Virtus.model
        
        attribute :id,                                Integer
        attribute :name,                              String
        
        def self.parse(data)
          data&.collect { |item| self.new(id: item.fetch("channelId")&.to_i, name: item.fetch("channelName")) }
        end
        
      end
      
    end
  end
end
