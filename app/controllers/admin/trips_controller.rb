module Admin
  class TripsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_trip, only: %i[edit update show destroy]

    def index
      @trips = Trip.all.order(created_at: :desc)
    end

    def show

    end

    def new
      @trip = Trip.new
    end

    def edit
    end

    def create
      @trip = Trip.new(trip_params)

      if @trip.save
        redirect_to admin_trip_url(@trip)
      else
        render :new
      end
    end

    def update
      respond_to do |f|
        if @trip.update(trip_params)
          f.html { redirect_to admin_trip_url(@trip) }
        else
          f.html { render :edit }
        end
      end
    end

    def destroy
      @trip.destroy

      respond_to do |f|
        f.html { redirect_to admin_trips_url }
      end
    end

    private

    def trip_params
      params.require(:trip).permit(:number_trip, :arrival_time, :departure_time, :service_type_id, :train_type_id, :company_id)
    end

    def set_trip
      @trip = Trip.find(params[:id])
    end
  end

end