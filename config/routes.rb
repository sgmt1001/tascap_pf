Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'homes#top'
  get '/about' => 'homes#about'
  resources :organizations do
    resources :projects, except: [:index]#create時に組織のidを渡すためにネスト#[:index,:create]
    #resources :belongings
  end
  resource :user, only: [:show,:edit,:update] do
    resources :projects,only: [:index,:create]
  end
  #projectのindexはuser/projects
  resources :tasks, except: [:index]

      #resources :belongings
end
