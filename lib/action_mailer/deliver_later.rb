require 'active_job'
require 'action_mailer'
require 'action_mailer/deliver_later/version'

module ActionMailer
  module DeliverLater
    extend ActiveSupport::Autoload
    autoload :Job
    autoload :Mixin
    autoload :MailMessageWrapper
  end
end
