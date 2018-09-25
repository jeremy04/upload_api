Rails.application.routes.draw do
  resources :avatars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'uploads' => 'uploads#create', defaults: { format: :json }

end
