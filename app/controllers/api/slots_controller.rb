require 'jwt'

module Api
  class SlotsController < ApplicationController
    # before_action :authenticate_user,only: [:availableSlot]
    def show
      car = CarParkSlot.where(park_slot_id: params[:id]).first
      # car = car[0] 
      # print car
      render :json => car.to_json()
    end

    

    def availableSlot
      user = nil
      if request.headers["Authorization"] then
       user =  JWT.decode request.headers["Authorization"],split(' ')[0], nil, false
      end
      slot = nil

      slot = ParkSlot.find_by_sql(["
      select ps.*, cps.car_id as car_id
      from park_slots ps
      left join car_park_slots cps on cps.park_slot_id = ps.id
      where ps.park_id = ? and cps.car_id is null
      ",params[:park_id]]).first
      # if user then
       
      # else
      #   slot = ParkSlot.find_by_sql(["
      #   select ps.* 
      #   from park_slots ps 
        
      #   "]).first
      # end
      render :json=> slot.to_json()
    end
  end
end