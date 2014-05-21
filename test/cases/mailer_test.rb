require 'helper'
require 'minitest/mock'

class MailerTest < ActiveSupport::TestCase

  setup { @mail = DelayedMailer.test_message(1,2,3) }

  test 'should be a MailMessageWrapper' do
    assert_equal @mail.class, ActionMailer::DeliverLater::MailMessageWrapper
  end

  test 'its object should be a Mail::Message' do
    assert_equal @mail.__getobj__.class, Mail::Message
  end

  test 'should respond to .deliver' do
    assert_respond_to @mail, :deliver
  end

  test 'should respond to .deliver!' do
    assert_respond_to @mail, :deliver!
  end

  test 'should respond to .deliver_later' do
    assert_respond_to @mail, :deliver_later
  end

  test 'should respond to .deliver_later!' do
    assert_respond_to @mail, :deliver_later!
  end

  test 'should enqueue the email with :deliver delivery method' do
    ret = ActionMailer::DeliverLater::Job.stub :enqueue, ->(*args){ args } do
      @mail.deliver_later
    end
    assert_equal ret, [DelayedMailer, :test_message, :deliver, 1, 2, 3]
  end

  test 'should enqueue the email with :deliver! delivery method' do
    ret = ActionMailer::DeliverLater::Job.stub :enqueue, ->(*args){ args } do
      @mail.deliver_later!
    end
    assert_equal ret, [DelayedMailer, :test_message, :deliver!, 1, 2, 3]
  end

  test 'should enqueue a delivery with a delay' do
    ret = ActionMailer::DeliverLater::Job.stub :enqueue_in, ->(*args){ args } do
      @mail.deliver_later in: 600
    end
    assert_equal ret, [600, DelayedMailer, :test_message, :deliver, 1, 2, 3]
  end

  test 'should enqueue a delivery at a specific time' do
    later_time = Time.now.to_i + 3600
    ret = ActionMailer::DeliverLater::Job.stub :enqueue_at, ->(*args){ args } do
      @mail.deliver_later at: later_time
    end
    assert_equal ret, [later_time, DelayedMailer, :test_message, :deliver, 1, 2, 3]
  end

end
