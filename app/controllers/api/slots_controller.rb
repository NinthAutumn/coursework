module Api
  class SlotsController < ApplicationController
    def show
      car = CarParkSlot.where(park_slot_id: params[:id]).first
      # car = car[0] 
      # print car
      render :json => car.to_json()
    end

    def availableSlot
      slot = CarParkSlot.where()
    end
  end
end