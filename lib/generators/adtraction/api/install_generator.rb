# frozen_string_literal: true

require "rails/generators/base"

module Adtraction
  module Api
    module Generators
      class InstallGenerator < Rails::Generators::NamedBase
        include Rails::Generators::ResourceHelpers
        
        source_root File.expand_path('templates', __dir__)

        desc "Creates an initializer for Adtraction::Api for your Rails application."
        
        def copy_initializer_file
          copy_file "config.rb", "config/initializers/adtraction_api.rb"
        end
      
      end
    end
  end
end
