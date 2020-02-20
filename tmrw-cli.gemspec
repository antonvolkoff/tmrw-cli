lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tmrw/version"

Gem::Specification.new do |spec|
  spec.name          = "tmrw-cli"
  spec.version       = Tmrw::VERSION
  spec.authors       = ["Anton Volkov"]
  spec.email         = ["choixer@gmail.com"]

  spec.summary       = ""
  spec.description   = ""
  spec.homepage      = "https://www.tomorrowhq.com/cli"

  # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "https://.."
  # spec.metadata["changelog_uri"] = "https://.."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |file|
      file.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-cli", "~> 0.4.0"
  spec.add_dependency "tty-prompt", "~> 0.20.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop", "~> 0.80.0"
end
