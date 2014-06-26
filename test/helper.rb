require 'bundler'
Bundler.setup

$LOAD_PATH << File.dirname(__FILE__) + '/../lib'
require 'action_mailer/deliver_later'
require_relative 'mailers/delayed_mailer'

ActiveJob::Base.queue_adapter = :inline
ActiveJob::Base.logger = Logger.new("/dev/null")


ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true

require 'active_support/testing/autorun'
require "minitest/autorun"

