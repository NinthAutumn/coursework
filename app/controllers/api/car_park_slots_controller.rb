module Api
  class CarParkSlotsController < ApplicationController
    before_action :authenticate_user, only: [:create]

    # POST /car_parks_slots
    def create
      car_park_slot = CarParkSlot.new(occupy_params)
      if car_park_slot.save
        render :json => car_park_slot
      else
        render :json => {messages:car_park_slot.errors.full_messages}
      end
    end

    private
      def occupy_params
        params.permit(:car_id,:park_slot_id)
      end
  end
end