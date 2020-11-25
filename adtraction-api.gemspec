
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "adtraction/api/version"

Gem::Specification.new do |spec|
  spec.name          = "adtraction-api"
  spec.version       = Adtraction::Api::VERSION
  spec.authors       = ["Sebastian Johnsson"]
  spec.email         = ["sebastian.johnsson@gmail.com"]

  spec.summary       = %q{Adtraction Ruby API Client}
  spec.description   = %q{Ruby client to interact with Adtraction's API}
  spec.homepage      = "https://github.com/SebastianJ/adtraction-api"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"]       =   spec.homepage
    spec.metadata["source_code_uri"]    =  "https://github.com/SebastianJ/adtraction-api"
    spec.metadata["changelog_uri"]      =  "https://github.com/SebastianJ/adtraction-api/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_dependency "faraday",                ">= 1.1.0"
  spec.add_dependency "faraday_middleware",     ">= 1.0.0"
  spec.add_dependency "virtus",                 ">= 1.0.5"

  spec.add_development_dependency "bundler",    ">= 1.17"
  spec.add_development_dependency "rake",       ">= 12.3.3"
  spec.add_development_dependency "rspec",      ">= 3.10.0"
  spec.add_development_dependency "vcr",        ">= 6.0"
  spec.add_development_dependency "webmock",    ">= 3.10.0"
  
  spec.add_development_dependency "generator_spec", ">= 0.9.4"
  
  spec.add_development_dependency "pry",        "~> 0.13.1"
end
