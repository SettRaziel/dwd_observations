Gem::Specification.new do |s|
  s.name          = "dwd_observations"
  s.version       = "0.1.0"
  s.summary       = "Object mapper and statistics for observation data from the german weather service"
  s.description   = "Scripts to read and statistically evaluate observation data from the german weather service"
  s.authors       = ["Benjamin Held"]
  s.email         = "me@bheld.eu"
  s.homepage      = "https://github.com/settraziel/wrf_statistics"
  s.licenses      = "MIT"

  s.files         = Dir["lib/**/*.rb"] + ["README.md", "LICENSE"]
  s.require_paths = ["lib"]

  s.required_ruby_version = "> 2.4"

  s.add_development_dependency "rake",      '~> 13.0', '>= 13.0.1'
  s.add_development_dependency "rspec", '~> 3.9', '>= 3.9.0'
end
