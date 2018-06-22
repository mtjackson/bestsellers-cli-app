
Gem::Specification.new do |s|
  s.name        = 'bestsellers-cli-app'
  s.version     = '0.0.0'
  s.date        = '2018-06-22'
  s.summary     = "Bestselling Books"
  s.description = "Provides details on the New York Times top 5 bestselling books"
  s.authors     = ["Mary Jackson"]
  s.email       = 'jackson.marytherese@gmail.com'
  s.files       = ["lib/book_details.rb", "lib/command_line_interface.rb", "lib/scraper.rb", "config/environment.rb"]
  s.homepage    = 'http://rubygems.org/gems/bestsellers-cli-app'
  s.license     = 'MIT'
  s.executables << 'bestsellers-cli-app'

  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
  s.add_development_dependency "colorize", ">= 0"
  s.add_development_dependency "open-uri", ">= 0"

end
