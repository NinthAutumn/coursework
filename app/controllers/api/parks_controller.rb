require 'json'

module Api 
  class ParksController < ApplicationController
    before_action :authenticate_user, only: [:update,:destroy,:create]
  
    # GET /api/parks
    def index
      conditions = {}
      if park_list_params[:user_id].present? then
        conditions[:user_id] = park_list_params[:user_id] 
      end
      parks = Park.all.where(conditions).limit(park_list_params[:limit]).order(park_list_params[:order_by])
      # parks[0] = nil
      render :json => parks.to_json()
    end
    

    # GET /api/parks/1
    def show
      
      # if param is simple return a simple park
      if params[:simple] then
        park = Park.find(params[:id])
        if !park
          return render :json =>{message:"Park Not Found"}, :status=>404
         end
        render :json => park.as_json(:include =>{:park_slots=>{}})
      else
        
      park = Park.joins(" left join users u on u.id = parks.user_id
      left join park_slots ps on ps.park_id = parks.id
      left join car_park_slots cps on cps.park_slot_id = ps.id")
      .select("parks.*, count(distinct ps.id)- count( cps.car_id) as available_slot_count,
      count(distinct ps.id) as total_slot_count").where(id:params[:id]).group("parks.id").first
      #if park not found return 404 render
      if !park
        
        return render :json =>{message:"Park Not Found"}, :status=>404
      end
      #render with all the joins loaded
      render :json => park.as_json(:include =>{:park_slots=>{:include=>:car_park_slot}})
      end
     
    end

  
  
    # POST /api/parks
    def create
      park = Park.new(park_params)
      if park.save
        render :json => park
      else
        render :json => {messages:park.errors.full_messages}
      end
    end
  
    # PATCH/PUT /api/parks/1
    def update
      park = Park.find(park_params[:id])
      #only user with the same user id as the park are able to edit the park
      if current_user.id != park.user_id then
       return render :json => { error: 'Access denied' }.to_json, :status=> :unauthorized
      end

      #if no error return park after updating
      if park.update(park_params) then
        render :json => park
      else
        render :json => {messages:park.errors.full_messages}.to_json
      end
    end
  
    # DELETE /api/parks/1
    def destroy

      park = Park.find(park_params[:id])
       #only user with the same user id as the park are able to delete the park
      if current_user.id != park.user_id then
        return render :json => { error: 'Access denied' }.to_json, :status=> :unauthorized
       end
      if park.destroy then
        render :json => {message:"success"}
      else
        render :json => {messages:park.errors.full_messages}
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_park
        @park = Park.find(params[:id])
      end

      

      # Only allow a list of trusted parameters through.
      def park_params
        params.permit(:id,:name, :description, :cover, :images, :avatar, :address_line_1, :address_line_2, :post_code,:user_id)
      end
      
      def park_list_params
        params.permit(:user_id,:order_by,:limit)
      end
  end
  
end
