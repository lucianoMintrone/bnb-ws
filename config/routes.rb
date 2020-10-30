Rails.application.routes.draw do
	get 'health' => 'health#show'

	resources :users
end
