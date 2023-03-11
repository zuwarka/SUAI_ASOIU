class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[edit update show destroy]

  def index
    @tickets = Ticket.by_user(current_user)
  end

  def show; end

  def new
    @employee_ticket = Employee.all.pluck(:id).to_a.sample
    @passenger_by_user = Passenger.all.by_user(current_user)
    @ticket = Ticket.new(employee_id: @employee_ticket)
  end

  def edit
    @passenger_by_user = Passenger.all.by_user(current_user)

  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.employee_id ||= Employee.all.pluck(:id).to_a.sample
    @passenger_by_user = Passenger.all.by_user(current_user)
    if @ticket.save
      p @ticket
      redirect_to ticket_url(@ticket)
    else
      render :new
    end
  end

  def update
    @passenger_by_user = Passenger.all.by_user(current_user)

    respond_to do |f|
      if @ticket.update(ticket_params)
        f.html { redirect_to ticket_url(@ticket) }
      else
        f.html { render :edit }
      end
    end
  end

  def destroy
    @passenger_by_user = Passenger.all.by_user(current_user)

    @ticket.destroy

    respond_to do |f|
      f.html { redirect_to tickets_url }
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:passenger_id, :trip_id, :employee_id)
  end

  def set_ticket
    @ticket = Ticket.by_user(current_user).where(id: params[:id]).first
  end
end
