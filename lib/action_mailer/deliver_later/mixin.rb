require 'active_support/concern'

module ActionMailer
  module DeliverLater
    module Mixin
      extend ActiveSupport::Concern

      module ClassMethods
        def method_missing(method_name, *args)
          if action_methods.include?(method_name.to_s)
            MailMessageWrapper.new(self, method_name, *args)
          else
            super
          end
        end
      end
    end
  end
end
