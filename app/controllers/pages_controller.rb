class PagesController < ApplicationController
  def home
  end

  def contact
    # call on contact emailer
    ContactMailer.with(contact_params).contact_email.deliver_now
    render :json=>{message:'Success'}
  end

  private
    def contact_params
      params.permit(:content,:subject)
    end
  
end
