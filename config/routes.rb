Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :follows, only: %i[create]
      delete '/unfollow', to: 'follows#unfollow'
      resources :teachers do
        collection do
          get 'specific_teacher_students'
        end
      end
    end
  end
end
