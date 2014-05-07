CraftBinWeb::Application.routes.draw do

  devise_for :users
  resources :schematics
  root 'home#index'

  match '/browse' => 'schematic#browse', via: [:get]
  match '/upload' => 'upload#upload', via: [:get]

  match '/:hash' => 'schematic#view', via: [:get]

end
