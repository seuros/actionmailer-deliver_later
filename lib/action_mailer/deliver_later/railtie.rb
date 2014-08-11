require 'active_job/railtie'
require 'action_mailer/railtie'

module Actionmailer
  module DeliverLater
    class Railtie < Rails::Railtie # :nodoc:
      initializer 'actionmailer-deliver_later' do
        ActiveSupport.on_load(:action_mailer) do
          prepend ActionMailer::DeliverLater::Mixin
        end
      end
    end
  end
end