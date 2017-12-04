class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event, only: [:create]
  before_action :find_comment, only: [:destroy]
  before_action :authorize_user!, only: [ :destroy]

  def create
    @comment = @event.comments.build(comment_params)

    @comment.user = current_user

    if @comment.save
      redirect_to event_path(@event)
    else
      @comments = @event.comments.order(created_at: :desc)
      render 'events/show'
    end
  end

  def destroy
    # if us
    # authorize! :destroy, @comment
    @event = @comment.event
    @comment.destroy
    redirect_to @event
  end


  private

  def find_event
    # byebug
    @event = Event.find(params[:event_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user!
    unless can?(:manage, @comment)
      flash[:alert] = "Access Denied!"
      redirect_to root_path
    end
  end
end
