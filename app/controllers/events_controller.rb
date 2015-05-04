class EventsController < ApplicationController

  def create
    event = Event.new(event_params)

    if event.save
      render status: 200, json: { 'OK' => true }
    else
      render status: 400, json: { 'OK' => false }
    end
  end

private

  def event_params
    params.permit(:version, :type, :timestamp, properties: [:url, :title, :path, :referrer, :shippingMethod, :revenue], traits: [:email, :name, 'friendCount', 'subscriptionPlan'])
  end

end