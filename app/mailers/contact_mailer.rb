class ContactMailer < ApplicationMailer
  default from: 'contact@surrey.ac.uk'
  def contact_email
    @content = params[:content]
    mail(to: 'ai00411@surrey.ac.uk', subject: params[:subject])
  end
end
