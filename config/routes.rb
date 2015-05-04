Rails.application.routes.draw do

  # Homepage with metrics for the last 24 hours.
  root 'reporting#home'

  # Endpoint where the webhook channel posts events.
  post '/events' => 'events#create'

end
