Rails.application.routes.draw do
  resources :answers
  #root page
  root 'answers#top', as: 'top'
  get 'thanks', to: 'answers#thanks', as: 'thanks'

  #rails_admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #devise
  devise_for :users

end
