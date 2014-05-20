module ActionMailer
  module DeliverLater
    class Job < ActiveJob::Base
      queue_as :mailers

      def perform(mailer, delivery, *parameters)
        mailer.constantize.send(delivery, *parameters).deliver
      end

      def logger
        ActionMailer::Base.logger
      end
    end
  end
end