# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'action_mailer/deliver_later/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'actionmailer-deliver_later'
  s.version     = '4.2.0.alpha'
  s.summary     = ''
  s.description = ''

  s.required_ruby_version = '>= 1.9.3'

  s.license = 'MIT'

  s.author   = ['David Heinemeier Hansson', 'Abdelkader Boudih']
  s.email    = ['david@loudthinking.com', 'terminale@gmail.com']
  s.homepage = 'http://www.rubyonrails.org'

  s.files        = Dir['MIT-LICENSE', 'README.rdoc', 'lib/**/*']
  s.require_path = 'lib'

  s.add_dependency 'actionmailer'
  s.add_dependency 'activejob'
end
