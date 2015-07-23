Rails.application.routes.draw do
  devise_for :users
  get 'public/home'

  root 'public#home'
  get '/*path' => "public#home"
end
