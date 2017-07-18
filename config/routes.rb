Rails.application.routes.draw do
  get 'pictures' => 'pictures#index' #take this 'get' request to the 'pictures' controller  'index' action     
end
