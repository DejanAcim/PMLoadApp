Rails.application.routes.draw do
 	root 'static_pages#home'
  get  'static_pages/home'
  get  'static_pages/help'
  devise_for :users
end
