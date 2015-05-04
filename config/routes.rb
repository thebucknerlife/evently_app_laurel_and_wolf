Rails.application.routes.draw do

  root 'reporting#home'

  post '/events' => 'events#create'

end
