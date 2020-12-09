# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_email
   ContactMailer.with(subject:'Important inquiry',content: "Hi, I have this inquiry about something that is very important and i hope you get this message").contact_email
  end
end
