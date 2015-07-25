Rails.application.routes.draw do
  devise_for :users
  get 'public/home'

  root 'public#home'

  scope '/api' do
    scope '/v1' do

      scope '/ping' do
        get '/' => 'ping#ping'
      end

      scope '/tasks' do
        get '/' => 'tasks#index'
        post '/' => 'tasks#create'
        scope '/:id' do
          get '/' => 'tasks#show'
          put '/' => 'tasks#update'
          delete '/' => 'tasks#destroy'
        end
      end

    end
  end


  get '/*path' => "public#home"
end
