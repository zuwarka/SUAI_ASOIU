class TrainTypesController < ApplicationController
  def index
    @train_types = TrainType.all
  end

  def show
    @train_type = TrainType.find(params[:id])
  end
end
