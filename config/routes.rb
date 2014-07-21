Rails.application.routes.draw do

  resources :locations, :only => [:show, :new, :create]

  root 'locations#new'
end
