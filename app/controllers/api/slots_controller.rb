require 'jwt'

module Api
  class SlotsController < ApplicationController
    # before_action :authenticate_user,only: [:availableSlot]
    before_action :authenticate_user, only: [:update,:destroy,:create]
    def show
      car = CarParkSlot.where(park_slot_id: params[:id]).first
      render :json => car.to_json()
    end


    def create
      slot = ParkSlot.new(slot_params)
      if slot.save
        render :json => slot
      else
        render :json => {messages:slot.errors.full_messages}
      end
    end

    def availableSlot
      #find available slot that doesnt have car park slot
      slot = ParkSlot.find_by_sql(["
      select ps.*, cps.car_id as car_id
      from park_slots ps
      left join car_park_slots cps on cps.park_slot_id = ps.id
      where ps.park_id = ? and cps.car_id is null
      ",params[:park_id]]).first
      render :json=> slot.to_json()
    end
    
    private
      def slot_params
        params.permit(:id,:height,:width,:price,:park_id)
      end
  end

end