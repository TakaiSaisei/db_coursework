Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'admin/dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
