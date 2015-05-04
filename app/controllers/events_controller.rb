class EventsController < ApplicationController

  # Events are posted here by the webhook channel.
  def create
    event = Event.new(event_params)

    if event.save
      render status: 200, json: { 'OK' => true }
    else
      render status: 400, json: { 'OK' => false }
    end
  end

  # I'd want to setup a error logging system, email an admin, or post to Slack/Hipchat if there was
  # an error here. Things can get really screwed up when analytics are bad and no one notices.

private

  def event_params
    params.permit(:version, :type, :timestamp, 'userId', :event, properties: [:url, :title, :path, :referrer, :shippingMethod, :revenue], traits: [:email, :name, 'friendCount', 'subscriptionPlan'])
  end

end