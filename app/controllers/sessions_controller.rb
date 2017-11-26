class SessionsController < ApplicationController

  def new
    end

    def create
      user = User.find_by(email: session_params[:email])
      if user && user.authenticate(session_params[:password])
        session[:user_id] = user.id
        flash[:notice] = 'Thank you for signing in.'
        redirect_to root_path
      else
        flash.now[:alert] = 'Wrong email or password.'
        redirect_to root_path
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Signed out'
    end

    private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
