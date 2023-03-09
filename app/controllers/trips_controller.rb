class TripsController < ApplicationController
  def index
    @trips = params[:q].blank? ? Trip.all.order(created_at: :desc) : Trip.all.number_trip_asc
  end

  def show
    @trip = Trip.where(id: params[:id]).first
  end

  def search
    @trip = Trip.where("number_trip = ?", params[:q]).first
  end
end
