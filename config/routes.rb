Rails.application.routes.draw do
  post 'map_center' => 'home#map_center'
  get 'map_center' => 'home#show'
  get 'map_json' => 'map#map_json'
  get 'home/index'
  get '/' => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
