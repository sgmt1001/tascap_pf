class SearchsController < ApplicationController
  
  def search_belonging
    @organization = Organization.find(params[:id])
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end
  
  def search_member
    @project = Project.find(params[:id])
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end
  
  
end
