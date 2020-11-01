Rails.application.routes.draw do
	get 'health' => 'health#show'

	resources :room_types

	resources :users
end
