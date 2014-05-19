require 'bundler'
Bundler.setup

$LOAD_PATH << File.dirname(__FILE__) + "/../lib"
require 'action_mailer/deliver_later'
require_relative 'mailers/delayed_mailer'

require 'active_support/testing/autorun'
