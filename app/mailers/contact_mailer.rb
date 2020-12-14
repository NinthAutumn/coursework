class ContactMailer < ApplicationMailer
  default from: 'contact@surrey.ac.uk'
  def contact_email
    # puts params[:subject]
    @content = params[:content]
    @subject = params[:subject]
    mail(to: 'ai00411@surrey.ac.uk', subject: params[:subject])
  end
end
