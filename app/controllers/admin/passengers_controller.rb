module Admin
  class PassengersController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_passenger, only: %i[edit update show destroy]
    def index
      @passengers = Passenger.all.order(created_at: :desc)
    end

    def show
      @passenger = Passenger.find(params[:id])
    end

    def new
      @passenger = Passenger.new
      @passenger.user ||= current_user
    end

    def edit
      @passenger = Passenger.find(params[:id])
    end

    def create
      @passenger = Passenger.new(passenger_params)
      @passenger.user_id = current_user.id

      respond_to do |f|
        if @passenger.save
          f.html { redirect_to admin_passengers_url(@passenger) }
        else
          f.html { render :new }
        end
      end
    end

    def update
      respond_to do |f|
        if @passenger.update(passenger_params)
          f.html { redirect_to admin_passenger_url(@passenger) }
        else
          f.html { render :edit }
        end
      end
    end

    def destroy
      @passenger.destroy

      respond_to do |f|
        f.html { redirect_to admin_passengers_url }
      end
    end

    private

    def passenger_params
      params.require(:passenger).permit(:first_name, :last_name, :birth_date, :passport_id, :citizenship)
    end

    def set_passenger
      @passenger = Passenger.find(params[:id])
    end
  end
end