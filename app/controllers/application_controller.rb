class ApplicationController < ActionController::Base
  include Knock::Authenticable
  # protect_from_forgery with: :exception
  # private

  # def authenticate_v1_user
  #   authenticate_for API::User
  # end
end
