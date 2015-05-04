Rails.application.routes.draw do

  post '/events' => 'events#create'

end
