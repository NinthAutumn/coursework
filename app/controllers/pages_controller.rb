class PagesController < ApplicationController
  def home
  end

  def contact
    # ContactMailer.contact_mail
    # if
    ContactMailer.with(contact_param).contact_email
  end

  private
    def contact_param
      params.require(:content)
      params.require(:subject)
    end
  
end
