Rails.application.routes.draw do
  resource :messages do
    collection do
      post 'reply'
    end
  end
  # get 'messages/reply'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
