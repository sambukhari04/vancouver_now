class HomeController < ApplicationController

  def index
    @events = Event.limit(7)
    @users = User.all
  end
end
