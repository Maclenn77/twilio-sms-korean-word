Rails.application.routes.draw do
  root 'static_pages#home'

  get 'about', to: 'static_pages#help'
  get 'support', to: 'static_pages#support'
  
  resource :messages do
    collection do
      post 'reply'
    end
  end
  # get 'messages/reply'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
