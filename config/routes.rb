Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  patch 'posts/:id' => 'posts#update'
  get 'posts/:id/edit' => 'posts#edit', as:'edit_post'
  get 'posts/america' => 'posts#america'
  get 'posts/canada' => 'posts#canada'
  get 'posts/uk' => 'posts#uk'
  get 'posts/aus' => 'posts#aus'
  get 'posts/sf' => 'posts#sf'
  get 'posts/ny' => 'posts#ny'
  resources :users, only: [:show]
  resources :posts do 
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  root 'posts#index'

end