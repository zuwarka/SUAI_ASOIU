class TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tickets = Ticket.by_user(current_user)
  end

  def show
    @ticket = Ticket.by_user(current_user).where(id: params[:id]).first
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |f|
      if @ticket.save
        f.html { redirect_to ticket_url(@ticket) }
      else
        f.html { render :new }
      end
    end
  end

  def update
    respond_to do |f|
      if @ticket.update(ticket_params)
        f.html { redirect_to ticket_url(@ticket) }
      else
        f.html { render :edit }
      end
    end
  end

  def destroy
    @ticket.destroy

    respond_to do |f|
      f.html { redirect_to tickets_url }
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:passenger_id, :employee_id, :trip_id)
  end
end
