class Api::V1::EventsController < Api::BaseController
  protect_from_forgery with: :null_session
  before_action :authenticate_api_user

  def index
    @events = Event.order(created_at: :desc).limit(10)
    render json: @events
  end

  def show
    event = Event.find params[:id]
    render json: event
  end

  def create
    event = Event.new event_params
    event.user = @api_user

    if event.save
      render json: event
    else
      render json: { errors: event.errors.full_messages }
    end
  end


  private

  def event_params
    params.require(:event).permit(:title, :description, :price, :make_date, :location, :category_id, :start_time, :end_time)
  end

  def authenticate_api_user
    @api_user = User.find_by_api_key request.headers['HTTP_API_KEY']
    head :unauthorized unless @api_user
  end

end
