require 'bundler'
Bundler.setup

$LOAD_PATH << File.dirname(__FILE__) + "/../lib"
require 'actionmailer/deliver_later'
require_relative 'mailers/delayed_mailer'
require_relative 'mailers/normal_mailer'

require 'active_support/testing/autorun'
