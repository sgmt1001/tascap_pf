Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'homes#top'
  get '/about' => 'homes#about'
<<<<<<< HEAD
  #organizationの所属の関連機能
=======
  #organizationの所属に関連する機能
>>>>>>> 3852d4bd2b86e406a6741a8305314380c4a95ea6
  get 'organizations/:id/belonging' => 'organizations#belonging',as:'organization_belonging'
  get 'organizations/:id/invite' => 'organizations#invite',as:'organization_belonging_invite'
  delete 'organizations/:id/invite' => 'organizations#invite_destroy',as:'organization_belonging_invite_destroy'
  get 'organizations/:id/belonging/search' => 'searchs#search_belonging',as:'organization_belonging_search'
<<<<<<< HEAD
  #projectのメンバー関連機能
=======
  #projectのメンバーに関連する機能
>>>>>>> 3852d4bd2b86e406a6741a8305314380c4a95ea6
  get 'organizations/:organization_id/projects/:id/member' => 'projects#member',as:'project_member'
  get 'organizations/:organization_id/projects/:id/invite' => 'projects#invite',as:'project_member_invite'
  delete 'organizations/:organization_id/projects/:id/invite' => 'projects#invite_destroy',as:'project_member_invite_destroy'
  get 'organizations/:organization_id/projects/:id/member/search' => 'searchs#search_member',as:'project_member_search'
  #spendableの関連機能
  get 'organizations/:organization_id/projects/:project_id/member/:id' => 'projects#set_spendable',as:'project_member_spendable'
  patch 'organizations/:organization_id/projects/:project_id/member/:id' => 'projects#set_spendable_update',as:'project_member_spendable_update'

  resources :organizations do
    resources :projects do
      resources :tasks do
        resources :comments, only: [:create, :destroy] do
           resource :reactions, only: [:create, :destroy]
        end
      end
    end
  end
  resources :users, except: [:new,:create] do
    resources :projects,only: [:index]
    resources :tasks,only: [:index]
  end
end
