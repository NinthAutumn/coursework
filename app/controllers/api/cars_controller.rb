
module Api
  class CarsController < ApplicationController

    before_action :authenticate_user, only: [:update,:destroy,:create]

    #GET /cars/:user_id/list
    def user_car_list
      car = Car.all.where(user_id: params[:user_id])
      render :json => car.to_json
    end

    # POST /cars
    # POST /cars.json
    def create
      car = Car.new(car_params)
      if car.save
        render :json => car
      else
        render :json => {messages:car.errors.full_messages}
      end
    end

    # PATCH/PUT /cars/1
    # PATCH/PUT /cars/1.json
    def update
      car = Car.find(car_params[:id])
      if car.update(car_params)
        render :json => car.to_json
      else
        render :json => {messages:car.errors.full_messages}
      end
    end

    # DELETE /cars/1
    # DELETE /cars/1.json
    def destroy
      car = Car.find(params[:id])
      if car.destroy
        render :json => {message:"success"}
      else
        render :json => {messages:car.errors.full_messages}
      end
    end

    private

      # Only allow a list of trusted parameters through.
      def car_params
        params.permit(:id,:name,:brand,:number_plate,:user_id)
      end
  end
end