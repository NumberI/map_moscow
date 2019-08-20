Rails.application.routes.draw do
  match 'map_center', to: 'home#map_center', via: :all
  get 'map_json' => 'map#map_json'
  # get 'home/index'
  get '/' => 'home#index'
end
