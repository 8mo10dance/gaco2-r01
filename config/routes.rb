Rails.application.routes.draw do
  root 'home#show'

  namespace :api do
    namespace :v1 do
      namespace :microposts do
        resource :upload_url, only: :show
      end
    end
  end
end
