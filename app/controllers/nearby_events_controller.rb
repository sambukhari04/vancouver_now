class NearbyEventsController < ApplicationController
  def index
    if params[:longitude] && params[:latitude]
      session[:longitude] = params[:longitude].to_f
      session[:latitude] = params[:latitude].to_f
    end
    if session[:latitude] && session[:longitude]
      @events = Event.near([session[:latitude], session[:longitude]], 20, units: :km)
      @hash = Gmaps4rails.build_markers(@events) do |event, marker|
        marker.lat event.latitude
        marker.lng event.longitude
        marker.infowindow "<a href='#{event_path(event)}'>#{event.title}</a>"
      end
    end
  end
end
