module Api
  class CarController < ApplicationController
    def user_car_list
      car = Car.find_by(user_id: params[:user_id])
      render :json => car.to_json
    end
  end
end