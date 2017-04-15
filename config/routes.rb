Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'place#index'

  get '/update_filters', to: 'place#update_markers_with_filter'
  get '/load_markers', to: 'place#load_markers'
  get '/demo', to: 'place#demo'
end
