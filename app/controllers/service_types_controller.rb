class ServiceTypesController < ApplicationController
  def index
    @service_types = ServiceType.all
  end

  def show
    @service_type = ServiceType.find(params[:id])
  end
end
