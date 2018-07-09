lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'campaign_inspector/version'

Gem::Specification.new do |spec|
  spec.name          = 'campaign_inspector'
  spec.version       = CampaignInspector::VERSION
  spec.authors       = ['evandrodutra']
  spec.email         = ['evandro.eld@gmail.com']

  spec.summary       = 'JOB Campaign Inspector'
  spec.description   = 'This gem is a simple discrepancy detector'
  spec.homepage      = ''

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.7'

  spec.add_runtime_dependency 'hashdiff', '~> 0.3.7'
  spec.add_runtime_dependency 'typhoeus', '~> 1.3.0'
end
