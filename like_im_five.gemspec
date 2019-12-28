require_relative 'lib/like_im_five/version'

Gem::Specification.new do |spec|
  spec.name          = "like_im_five"
  spec.version       = LikeImFive::VERSION
  spec.authors       = ["Clement Morisset"]
  spec.email         = ["morissetcl87@gmail.com"]

  spec.summary       = "https://github.com/morissetcl"
  spec.description   = "https://github.com/morissetcl"
  spec.homepage      = "https://github.com/morissetcl"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/morissetcl"
  spec.metadata["changelog_uri"] = "https://github.com/morissetcl"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "rails", ">= 5.1.4"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "pg"
end
