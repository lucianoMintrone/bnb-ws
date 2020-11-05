Rails.application.routes.draw do
	get 'health' => 'health#show'

	resources :hosts, only: [] do
		resources :rooms, only: [:create, :index]
	end

	resources :room_types

	resources :users do
		collection do
			post 'auth' => 'users#auth'
		end
	end
end
