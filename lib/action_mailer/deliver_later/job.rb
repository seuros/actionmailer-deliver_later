module ActionMailer
  module DeliverLater
    class Job < ActiveJob::Base
      queue_as :mailers

      def perform(mailer, delivery, *parameters)
        mailer.constantize.send(delivery, *parameters).deliver
      end
    end
  end
end