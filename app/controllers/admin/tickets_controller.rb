module Admin
  class TicketsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_ticket, only: %i[edit update show destroy]

    def index
      @tickets = Ticket.all.order(created_at: :desc)
    end

    def show

    end

    def new
      @ticket = Ticket.new
    end

    def edit
    end

    def create
      @ticket = Ticket.new(ticket_params)

      if @ticket.save
        p @ticket
        redirect_to admin_ticket_url(@ticket)
      else
        render :new
      end
    end

    def update
      respond_to do |f|
        if @ticket.update(ticket_params)
          f.html { redirect_to admin_ticket_url(@ticket) }
        else
          f.html { render :edit }
        end
      end
    end

    def destroy
      @ticket.destroy

      respond_to do |f|
        f.html { redirect_to admin_tickets_url }
      end
    end

    private

    def ticket_params
      params.require(:ticket).permit(:passenger_id, :trip_id, :employee_id)
    end

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
  end
end