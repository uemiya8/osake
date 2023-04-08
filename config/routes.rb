Rails.application.routes.draw do
  
  namespace :public do
   resources :liquor, only:[:index, :create,:show, :edit, :update ]
   resources :genres, only:[:index, :create, :edit, :update]
   resources :customers, only:[:index, :show, :edit, :update]
   get 'customers/unsubscribe' =>'customers#unsubscribe'
   patch 'customers/withdraw' => 'customers#withdraw'
   resources :post, only:[:index, :show, :new, :create, :update]
   delete '/post/destroy_all' => 'post#destroy_all'
   root to: 'homes#top'
   get 'customers/my_page' =>'customers#show'
  end
  
  
  namespace :admin do
   resources :liquor, only:[:index, :create,:show, :edit, :update ]
   resources :genres, only:[:index, :create, :edit, :update]
   resources :customers, only:[:index, :show, :edit, :update]
   resources :post, only:[:index, :show, :create, :update]
   root to: 'homes#top'
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
