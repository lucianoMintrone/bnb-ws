Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	get 'health' => 'health#show'

	resources :hosts, only: [] do
		resources :rooms, only: [:create]
	end
	get 'hosts/:host_id/rooms' => 'rooms#index_for_host'

	resources :rooms, only: [:index, :update, :destroy] do
		resources :bookings, only: [:create]
		resources :comments, only: [:create]
	end

	resources :room_types

	resources :users do
		collection do
			post 'auth' => 'users#auth'
		end
	end
end
