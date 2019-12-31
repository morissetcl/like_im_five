$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "dummy_app/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "dummy_app"
  spec.version     = DummyApp::VERSION
  spec.authors     = ["Clement Morisset"]
  spec.email       = ["morissetcl87@gmail.com"]
  spec.homepage    = "https://github.com/morissetcl/like_im_five"
  spec.summary     = "https://github.com/morissetcl/like_im_five"
  spec.description = "https://github.com/morissetcl/like_im_five"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://github.com/morissetcl/like_im_five"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.4", ">= 5.2.4.1"

  spec.add_development_dependency "string-similarity"
  spec.add_development_dependency "pg"
  spec.add_development_dependency "rspec", "~> 3.2"
end
