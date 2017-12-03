class LikesController < ApplicationController
  # before_action :authenticate_user!

  def create
    event = Event.find params[:event_id]
    like = Like.new(user: current_user, event: event)
    if like.save
      redirect_to event, notice: 'Thanks for liking!'
    else
      redirect_to event, alert: 'You already  liked the item.'
    end
  end

  def show
    @like = @event.likes.find_by_user_id current_user
  end

  def destroy
    like = Like.find params[:id]
    like.destroy
    redirect_to like.event, notice: 'Like removed!'
  end


end
