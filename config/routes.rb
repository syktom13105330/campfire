Rails.application.routes.draw do
 
  devise_for :users
  root 'rooms#index'
#   resources :rooms
  get 'rooms/new'
  get 'rooms/:room_id' => 'rooms#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'

end
