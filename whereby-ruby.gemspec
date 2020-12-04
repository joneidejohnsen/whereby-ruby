lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'whereby/version'

Gem::Specification.new do |spec|
  spec.name          = "whereby-ruby"
  spec.version       = Whereby::VERSION
  spec.authors       = ["Daniel Kittilsen Henriksen"]
  spec.email         = ["tech@poption.com"]

  spec.summary       = "A Ruby Whereby Wrapper"
  spec.description   = "Easily use Whereby's HTTP API to create video rooms and conferences"
  spec.homepage      = "https://github.com/poption/whereby-ruby"
  spec.license       = "MIT"

  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/poption/whereby-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/poption/whereby-ruby"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
end
