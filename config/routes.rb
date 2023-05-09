Rails.application.routes.draw do
  
  namespace :public do
   resources :liquor, only:[:index, :create,:show, :edit, :update ]
   resources :genres, only:[:index, :create, :edit, :update]
   get 'customers/unsubscribe' =>'customers#unsubscribe'
   patch 'customers/withdraw' => 'customers#withdraw'
   resources :customers, only:[:index, :show, :edit, :update]
   resources :posts, only:[:index, :show, :edit, :new, :create, :update, :destroy]
   delete '/post/destroy_all' => 'post#destroy_all'
   get 'customers/my_page' =>'customers#show'
  end
   root to: 'public/homes#top'
  
  
  namespace :admin do
   resources :liquor, only:[:index, :create,:show, :edit, :update ]
   resources :genres, only:[:index, :create, :edit, :update, :destroy]
   resources :customers, only:[:index, :show, :edit, :update, :destroy]
   resources :posts, only:[:index, :show, :edit, :create, :update, :destroy]
   root to: 'posts#index'
  end
 
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }
 
 devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
 sessions: "admin/sessions"
 }
   
  
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

end
