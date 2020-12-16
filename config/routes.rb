Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	get 'health' => 'health#show'

	resources :bookings, only: [] do
		post 'mark_as_favorite' => 'bookings#mark_as_favorite'
	end

	resources :guests, only: [] do
		get 'bookings' => 'bookings#index_for_guest'
	end

	resources :hosts, only: [] do
		resources :rooms, only: [:create]
	end
	get 'hosts/:host_id/rooms' => 'rooms#index_for_host'

	resources :rooms, only: [:index, :update, :destroy] do
		resources :bookings, only: [:create]
		resources :comments, only: [:create]
	end
	get 'rooms/:room_id/bookings' => 'bookings#index_for_room'

	resources :room_types

	resources :users do
		collection do
			post 'auth' => 'users#auth'
		end
	end
end
