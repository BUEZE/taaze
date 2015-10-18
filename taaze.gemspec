$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'taaze/version'

Gem::Specification.new do |s|
  s.name        =  'taaze'
  s.version     =  Taaze::VERSION
  s.executables << 'taaze'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-rg'
  s.date        =  Taaze::DATE
  s.summary     =  'Data extractor of Taaze'
  s.description =  'Get the book comments or collections of specific user.'
  s.authors     =  ['Bueze']
  s.email       =  ''
  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage    =  'https://github.com/BUEZE/taaze'
  s.license     =  'MIT'
end
