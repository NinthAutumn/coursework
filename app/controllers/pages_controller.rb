class PagesController < ApplicationController
  def home
  end

  def contact
    # ContactMailer.contact_mail
    ContactMailer.with(params).contact_email
  end
end
