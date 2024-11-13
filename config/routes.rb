Rails.application.routes.draw do
  devise_for :users
  post 'send_welcome_email', to: 'user#send_welcome_email', as: :send_welcome_email
  resources :events do
    collection do
      get :view # Ruta personalizada para la acción view
    end
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
end
