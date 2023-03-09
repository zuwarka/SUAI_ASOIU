module Admin
  class EmployeesController < ApplicationController
    def index
      @employees = Employee.all
    end

    def show
      @employee = Employee.find(params[:id])
    end

    def create
    end

    def update
    end

    def destroy
    end
  end

end