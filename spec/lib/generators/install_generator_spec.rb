require "generator_spec"

require "generators/adtraction/api/install_generator"

RSpec.describe ::Adtraction::API::Generators::InstallGenerator, type: :generator do
  root_dir = File.expand_path("../../../tmp/rails_app", __FILE__)
  
  destination root_dir
  arguments %w(Adtraction)

  before :all do
    prepare_destination
    run_generator
  end
  
  it "creates a configuration initializer" do
    assert_file "config/initializers/adtraction_api.rb", /Adtraction::API.configure do/i
  end
  
end
