module Admin
  class EmployeesController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_employee, only: %i[edit update show destroy]

    def index
      @employees = Employee.all.order(created_at: :desc)
    end

    def show

    end

    def new
      @employee = Employee.new
    end

    def edit
    end

    def create
      @employee = Employee.new(employee_params)

      if @employee.save
        redirect_to admin_employee_url(@employee)
      else
        render :new
      end
    end

    def update
      respond_to do |f|
        if @employee.update(employee_params)
          f.html { redirect_to admin_employee_url(@employee) }
        else
          f.html { render :edit }
        end
      end
    end

    def destroy
      @employee.destroy

      respond_to do |f|
        f.html { redirect_to admin_employees_url }
      end
    end

    private

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :name_station, :position_id)
    end

    def set_employee
      @employee = Employee.find(params[:id])
    end
  end
end