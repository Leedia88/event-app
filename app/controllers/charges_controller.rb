class ChargesController < ApplicationController
  before_action :authenticate_user

    def new
      @event = Event.find(params[:event_id])
    end
    
    def create
      # Amount in cents
      @event = Event.find(params[:event_id])
      @amount = @event.price

      begin
  
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'usd',
      })
     
    
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
      end

    end

    Attendance.create(
      attendee_id: current_user.id,
      event: @event,
      stripe_customer_id: customer.id
    )
  
    redirect_to event_path(@event.id)

end
