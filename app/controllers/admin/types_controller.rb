module Admin
  class TypesController < ApplicationController
    def board
      @companies = Company.all
      @service_types = ServiceType.all
      @train_types = TrainType.all
    end
  end
end