require_relative 'gem_version'

module Actionmailer
  module DeliverLater
    def self.version
      gem_version
    end
  end
end
