module Api 
  class UsersController < ApplicationController
    before_action :authenticate_user,only: [:me]
    
    #GET /api/users/self/show
    def me
      #render logged in user
      render :json => current_user
    end

    #GET /api/users/:id
    def show
      begin
        user = User.find(params[:id])
      rescue StandardError => e
        #if error render with status not found
        return render :json =>{message:"User Not Found"}, :status=>404
      end
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
      # Only allow a list of trusted parameters through.
      def user_params
        params.permit(:username,:email, :password, :password_confirmation)
      
   end
  end
end 