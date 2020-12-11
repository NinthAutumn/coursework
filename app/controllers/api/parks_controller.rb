require 'json'

module Api 
  class ParksController < ApplicationController
    before_action :authenticate_user, only: [:update,:destroy,:create]
  
    # GET /parks
    # GET /parks.json
    def index
      conditions = {}
      if params[:user_id].present? then
        conditions[:user_id] = params[:user_id] 
      end
      parks = Park.all.where(conditions).limit(params[:limit]).order(params[:order_by])
      # parks[0] = nil
      render :json => parks.to_json()
    end
    
    def show_simple
      
    end

    # GET /parks/1
    # GET /parks/1.json
    def show
      # park = Park.joins(:user,park_slots: :car_park_slot).where(id:park_params[:id]).group(:id).first
      if params[:simple] then
        park = Park.find(params[:id])
        render :json => park.as_json(:include =>{:park_slots=>{}})
      else
        park = Park.find_by_sql(["select p.*,
        json_object('id',u.id,'username',u.username,'email',u.email) as user,
        json_group_array(json_object('id',ps.id,'price',ps.price,'height',ps.height,'width',ps.width)) as park_slots,
         count(distinct ps.id)-count(distinct cps.car_id) as available_slot_count,
         count(distinct ps.id) as total_slot_count
        from parks p
        inner join users u on u.id = p.user_id
        left join park_slots ps on ps.park_id = p.id
        left join car_park_slots cps on cps.park_slot_id = ps.id
        where p.id = ?
        group by p.id",park_params[:id]]).first
        
        # .execute_sql("
       
        # ",[park_params[:id]])
        # render :json => park
        # park = park[0]
        park['user'] = JSON.parse(park['user'])
        park['park_slots'] = JSON.parse(park['park_slots'])
        #park.park_slots = JSON.parse(park.park_slots)
        # render :json => park.as_json(:include =>{:park_slots=>{:include=>:car_park_slot}})
        render :json => park
      end
     
    end

  
    # GET /parks/1/edit
  
    # POST /parks
    # POST /parks.json
    def create
      park = Park.new(park_params)
      if park.save
        render :json => park
      else
        render :json => {messages:park.errors.full_messages}
      end
    end
  
    # PATCH/PUT /parks/1
    # PATCH/PUT /parks/1.json
    def update
      park = Park.find(park_params[:id])
      if current_user.id != park.user_id then
        respond_to do |format|
          format.json do
            self.status = :unauthorized
            self.response_body = { error: 'Access denied' }.to_json
          end
        end
      end
      if park.update(park_params) then
        render :json => park
      else
        render :json => {messages:park.errors.full_messages}
      end
    end
  
    # DELETE /parks/1
    # DELETE /parks/1.json
    def destroy

      park = Park.find(park_params[:id])
      # if current_user.id != park.user_id then
      #   respond_to do |format|
      #     format.json do
      #       self.status = :unauthorized
      #       self.response_body = { error: 'Access denied' }.to_json
      #     end
      #   end
      # end
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
        params.permit(:user_id,:limit,:order_by)
      end
  end
  
end
