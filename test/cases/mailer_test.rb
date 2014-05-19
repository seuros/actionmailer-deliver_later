require 'helper'

class MailerTest < ActiveSupport::TestCase
  test 'should respond to .deliver_later' do
    assert_respond_to(DelayedMailer, :deliver_later)
  end

  test 'should respond to .deliver_async' do
    assert_respond_to(DelayedMailer, :deliver_async)
  end

  test 'should not respond to .deliver_later' do
    assert_not_respond_to(NormalMailer, :deliver_later)
  end

  test 'should not respond to .deliver_async' do
    assert_not_respond_to(NormalMailer, :deliver_async)
  end
end
