require 'active_job'
require 'action_mailer'
require_relative 'deliver_later/version'

module ActionMailer
  module DeliverLater
    extend ActiveSupport::Autoload
    autoload :Job
    autoload :Mixin
    autoload :MailMessageWrapper
  end
end

require_relative 'deliver_later/railtie' if defined?(::Rails)
