lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "bestsellers"
  spec.version       = "0.0.0"
  spec.authors       = ["Mary Jackson"]
  spec.email         = ["jackson.marytherese@gmail.com"]

  spec.summary       = "Lists top 5 bestselling books from NYT bestsellers list"
  spec.homepage      = "https://github.com/mtjackson/bestsellers-cli-app"
  spec.license       = "MIT"

  spec.executables   = "bestsellers-cli-app"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "colorize"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "open-uri"
  spec.add_development_dependency "pry"
end
