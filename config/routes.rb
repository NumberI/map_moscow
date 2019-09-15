Rails.application.routes.draw do
  get 'map_json' => 'map#map_json'
  get '/' => 'home#index'
end
