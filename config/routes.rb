Rails.application.routes.draw do
	get 'health' => 'health#show'

	resources :hosts, only: [] do
		resources :rooms, only: [:create]
	end

	resources :room_types

	resources :users
end
