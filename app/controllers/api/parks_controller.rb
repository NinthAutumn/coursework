require 'json'

module Api 
  class ParksController < ApplicationController
    before_action :set_park, only: [:show, :edit, :update, :destroy]
  
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
        inner join park_slots ps on ps.park_id = p.id
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

    # GET /parks/new
    def new
      @park = Park.new
    end
  
    # GET /parks/1/edit
    def edit
    end
  
    # POST /parks
    # POST /parks.json
    def create
      @park = Park.new(park_params)
  
      respond_to do |format|
        if @park.save
          format.html { redirect_to @park, notice: 'Park was successfully created.' }
          format.json { render :show, status: :created, location: @park }
        else
          format.html { render :new }
          format.json { render json: @park.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /parks/1
    # PATCH/PUT /parks/1.json
    def update
      respond_to do |format|
        if @park.update(park_params)
          format.html { redirect_to @park, notice: 'Park was successfully updated.' }
          format.json { render :show, status: :ok, location: @park }
        else
          format.html { render :edit }
          format.json { render json: @park.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /parks/1
    # DELETE /parks/1.json
    def destroy
      @park.destroy
      respond_to do |format|
        format.html { redirect_to parks_url, notice: 'Park was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_park
        @park = Park.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def park_params
        params.permit(:id,:name, :description, :cover, :images, :avatar, :address_line_1, :address_line_2, :post_code)
      end
      
      def park_list_params
        params.permit(:user_id,:limit,:order_by)
      end
  end
  
end
