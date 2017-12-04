class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find params[:event_id]
    like = Like.new(user: current_user, event: event)
    if !can? :like, event
      head :unauthorized
    elsif like.save
      redirect_to event, notice: 'You are going!'
    else
      redirect_to event, alert: 'You are going already!'
    end
  end



  def destroy
    like = Like.find params[:id]
    if can? :destroy, like
      like.destroy
      redirect_to like.event, notice: 'You are not going!'
    else
      head :unauthorized
    end
  end
end
