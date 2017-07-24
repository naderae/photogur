Rails.application.routes.draw do
  root 'pictures#index'
  get 'pictures' => 'pictures#index'

  get 'pictures' => 'pictures#index'

  get 'pictures/:id/edit' => "pictures#edit"
  patch 'pictures/:id' => "pictures#update"

  post 'pictures' => 'pictures#create'
  get 'pictures/new' => 'pictures#new'

  delete 'pictures/:id' => 'pictures#destroy'

  get 'pictures/:id' => 'pictures#show'

end
