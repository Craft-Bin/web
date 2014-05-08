CraftBinWeb::Application.routes.draw do

  devise_for :users
  resources :schematics
  root 'home#index'

  match '/browse' => 'schematic#browse', via: [:get]
  match '/creations' => 'schematic#user_browse', via: [:get]
  match '/upload' => 'schematics#upload', via: [:get]

  match '/:hash' => 'schematic#view', via: [:get]

end
