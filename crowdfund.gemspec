Gem::Specification.new do |s|
  s.name         = "crowdfund"
  s.version      = "1.0.0"
  s.author       = "Edmund Sumbar"
  s.email        = "esumbar@gmail.com"
  s.homepage     = "https://github.com/esumbar/crowdfund"
  s.summary      = "Pragmatic Studio online Ruby course project"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'crowdfund' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 0'
end
