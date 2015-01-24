Rails.application.routes.draw do
  root 'static_pages#index'

  namespace :api do
    namespace :v1 do
      resource :special_quest_time, only: [:show]
    end
  end
end
