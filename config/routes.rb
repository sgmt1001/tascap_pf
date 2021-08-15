Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'homes#top'
  get '/about' => 'homes#about'
  resources :organizations do
    resources :projects do#create時に組織のidを渡すためにネスト
      resources :tasks
    end
  end
  resources :users, only: [:show,:edit,:update] do
    resources :projects#projectのindexはuser/projects
  end
  #resources :tasks, except: [:index]

end
