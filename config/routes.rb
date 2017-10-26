Rails.application.routes.draw do
  root  'static_pages#home'

  get   'team_daily_workload/chart'
  get   'static_pages/home'
  get   'static_pages/help'

  devise_for :users
  resources :team_daily_workload
  resources :workloads do
  	collection do
  		post :confirm
  	end
  end
end
