Rails.application.routes.draw do
  resources :kinds
  resources :contacts do
    resource :kind, only: [ :show ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
