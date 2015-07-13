Rails.application.routes.draw do
  get 'public/home'

  root 'public#home'
end
