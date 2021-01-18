Rails.application.routes.draw do

  resources :proposals, only: [:index] do
    post 'submit', on: :collection
  end
  resources :courses, :teachers, only: [:index, :show] do
    resources :votes, only: [:create, :destroy]
  end

end
