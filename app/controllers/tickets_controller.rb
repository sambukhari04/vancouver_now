class TicketsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = Event.find(params[:event_id])
  end

  def create
    # Amount in cents
    @event = Event.find(params[:event_id]) # find the item
    @amount = @event.price.to_i * 100
    # @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Stripe customer',
      :currency    => 'cad'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_item_ticket_path
  end

end
