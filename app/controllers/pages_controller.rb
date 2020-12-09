class PagesController < ApplicationController
  def home
  end
  def contact
    ContactMailer.with(params).contact_mail
  end
end
