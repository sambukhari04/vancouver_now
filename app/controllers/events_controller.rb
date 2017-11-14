class EventsController < ApplicationController


  def new
    @event = Event.new
  end



  def create
    @event = Event.new event_params
    # @event.user = current_user

    if @event.save
      # flash notice
      redirect_to event_path(@event)

    else
      render :new
    end
  end

    def show
      @event = Event.find params[:id]
    end

    def edit
      @event = Event.find params[:id]
    end

    def index
      @events = Event.order(created_at: :desc)
    end













    private
    def event_params
        params.require(:event).permit(:title, :description, :price, :make_date, :location)
    end
end
