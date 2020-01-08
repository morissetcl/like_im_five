require_relative 'lib/like_im_five/version'

Gem::Specification.new do |spec|
  spec.name          = "like_im_five"
  spec.version       = LikeImFive::VERSION
  spec.authors       = ["Clément Morisset"]
  spec.email         = ["morissetcl87@gmail.com"]

  spec.summary       = "Create a complex testing context in a few seconds."
  spec.description   = "Like Im Five generate a file with factories you need to test a specific object. It use your development database to retrieve the object you want and all associations you will have need to setup the test."
  spec.homepage      = "https://github.com/morissetcl"
  spec.license       = "MIT"
  spec.post_install_message = "Like Im Five installed! Thx."
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables << "like_im_five"
  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.require_paths = ["lib"]
  spec.add_dependency "rails", ">= 5.1.4"
  spec.add_development_dependency "rspec", "~> 3.2"
end
