module Admin
  class PositionsController < ApplicationController
    def index
      @positions = Position.all
    end

    def show
      @position = Position.find(params[:id])
    end

    def create
    end

    def update
    end

    def destroy
    end
  end
end
