Rails.application.routes.draw do
	get 'health' => 'health#show'

	resources :hosts, only: [] do
		resources :rooms, only: [:create]
	end
	get 'hosts/:host_id/rooms' => 'rooms#index_for_host'

	resources :rooms, only: [:index, :update, :destroy] do
		resources :bookings, only: [:create]
	end

	resources :room_types

	resources :users do
		collection do
			post 'auth' => 'users#auth'
		end
	end
end
