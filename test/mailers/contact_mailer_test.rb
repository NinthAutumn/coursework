require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "contact_email sends properly" do
    email = ContactMailer.with(subject:"asdfasfasf",content:"asdfasfasdfadsfasdfasdfasdf").contact_email
    assert_emails 1 do
      email.deliver_now
    end
    assert_equal ["contact@surrey.ac.uk"], email.from
    assert_equal ["ai00411@surrey.ac.uk"], email.to
    assert_equal "asdfasfasf", email.subject
  end

  test "contact email wont send if no proper prop" do
    assert_raise(){
      email = ContactMailer.with(subject:"asdfasfasf").contact_email.deliver_now
    }
    assert_raise(){
      email = ContactMailer.with(content:"asdfasfasf").contact_email.deliver_now
    }
  end
end
