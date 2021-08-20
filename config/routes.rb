Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'homes#top'
  get '/about' => 'homes#about'
  get 'organizations/:id/belonging' => 'organizations#belonging',as:'organization_belonging'
  get 'organizations/:id/invite' => 'organizations#invite',as:'organization_belonging_invite'
  get 'organizations/:id/belonging/search' => 'searchs#search_belonging',as:'organization_belonging_search'
  get 'organizations/:id/projects/:id/member' => 'projects#member',as:'project_member'
  get 'organizations/:id/projects/:id/invite' => 'projects#invite',as:'project_member_invite'
  get 'organizations/:id/projects/:id/member/search' => 'searchs#search_member',as:'project_member_search'
  get 'organizations/:id/projects/:id/member/:id' => 'projects#set_spendable',as:'project_member_spendable'
  patch 'organizations/:id/projects/:id/member/:id' => 'projects#set_spendable_update',as:'project_member_spendable_update'
  resources :organizations do
    resources :projects do
      resources :tasks
    end
  end
  resources :users, except: [:new,:create] do
    resources :projects
  end
end
