Rails.application.routes.draw do
  root 'static_pages#home'

  get 'about', to: 'static_pages#help'
  get 'support', to: 'static_pages#support'
  
  resource :messages do
    collection do
      post 'reply'
    end
  end
end
