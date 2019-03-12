RSpec.configure do |config|
  config.before(:each) do
    # The famous singleton problem
    Adtraction::Api.configure do |config|
      config.api_key    =   nil
    end
  end
end

require "yaml"

def setup_client(type = :full)
  cfg_path              =   File.join(File.dirname(__FILE__), "../../credentials.yml")
  
  if ::File.exists?(cfg_path)
    cfg                 =   YAML.load_file(cfg_path)

    Adtraction::Api.configure do |config|
      config.api_key    =   cfg["api_key"]
  
      config.faraday    =   {
        user_agent: "Adtraction Ruby Client #{::Adtraction::Api::VERSION}",
        verbose:    false
      }
    end
  else
    raise "Missing credentials.yml file - you need to create one and include your api key in order to run the specs."
  end
end
