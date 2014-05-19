module ActionMailer
  module DeliverLater
    module Mixin
      def deliver_later(delivery, *parameters)
        ActionMailer::DeliverLater::Job.enqueue self.class, delivery, *parameters
      end

      alias_method :deliver_async, :deliver_later
    end
  end
end
