class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update,  :destroy]
  before_action :authorize_user!, except: [:index, :show, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_categories, only: [:new, :create, :edit, :update]

  def new
    @event = Event.new
  end


  def create
    @event = Event.new event_params
    @event.user = current_user

    if @event.save
      # flash notice
    redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
      # @event = Event.find params[:id]
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @event }
    end
  end

  def edit
    # @event = Event.find params[:id]
  end

  def update
    # return head :unauthorized unless can?(:update, @event)
    if @event.update event_params
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  # def index
  #   @events = Event.order(created_at: :desc)
  # end


  def index
      # @events = Event.all
    if params[:search]
      @events = Event.search(params[:search]).order("created_at DESC")
      # @discounts = Discount.search(params[:search])
      # @combined = {
      #   :events: @events,
      #   :discounts: @discounts
      # }
    else
      @events = Event.all.order('created_at DESC')
    end
  end










  private

  def event_params
    params.require(:event).permit(:title, :description, :price, :make_date, :location, :category_id, :start_time, :end_time, :image, :street, :city, :province, :postal
   )
  end

  def find_event
    @event = Event.find params[:id]
  end


  def get_categories
    @categories = Category.all
  end

  def authorize_user!
    unless can?(:manage, @event)
      flash[:alert] = "Access Denied!"
      redirect_to root_path
    end
  end
end
