module Api 
  class UsersController < ApplicationController
    before_action :authenticate_user,except: [:create]

    def me
      render :json => current_user
    end

    def show
      user = User.find(params[:id])
      render :json=> user.to_json()
    end

    def create
      user = User.new(user_params)
      if user.save then
        render :json => user
      else 
        render :json => {messages:user.errors.full_messages}, status: 409
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      # def set_user
      #   @user = User.find(params[:id])
      # end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.permit(:username,:email, :password, :password_confirmation)
      
   end
  end
end 