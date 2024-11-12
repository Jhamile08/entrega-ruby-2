Rails.application.routes.draw do
  devise_for :users
  resources :events do
    collection do
      get :view # Ruta personalizada para la acción view
    end
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
end
