# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pagfor/version'

Gem::Specification.new do |spec|
  spec.add_development_dependency "rspec"
  spec.add_dependency "bindata"

  spec.name          = "pagfor"
  spec.version       = Pagfor::VERSION
  spec.authors       = ["Marivaldo Malaquias"]
  spec.email         = ["marivaldo@gmail.com"]
  spec.summary       = %q{Formato PagFor Bradesco.}
  spec.description   = %q{Formato PagFor Bradesco. Gem baseada na cnab240 (https://github.com/eduardordm/cnab240), desenvolvida por Eduardo Mourão.}
  spec.homepage      = ""

  spec.files         = Dir.glob('lib/**/*') + ['Rakefile'] + ['pagfor.gemspec']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
