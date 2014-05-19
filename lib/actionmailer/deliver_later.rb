require 'actionmailer/deliver_later/version'
require 'action_mailer'
require 'active_job'

module ActionMailer
  class DeliverLaterJob < ActiveJob::Base
    queue_as :mailers

    def perform(mailer, delivery, *parameters)
      mailer.constantize.send(delivery, *parameters).deliver
    end
  end
end

class ApplicationMailer < ActionMailer::Base
  def deliver_later(delivery, *parameters)
    ActionMailer::DeliverLaterJob.enqueue self.class, delivery, *parameters
  end

  alias_method :deliver_async, :deliver_later
end
