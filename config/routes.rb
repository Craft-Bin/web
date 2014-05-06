CraftBinWeb::Application.routes.draw do

  devise_for :users
  root 'home#index'

  match '/browse' => 'schematic#browse', via: [:get]
  match '/:hash' => 'schematic#view', via: [:get]

end
