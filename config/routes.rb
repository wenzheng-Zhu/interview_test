Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :follows, only: %i[create]
      delete '/unfollow', to: 'follows#unfollow'
    end
  end
end
