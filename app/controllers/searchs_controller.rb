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
    @organization = @project.organization
    if params[:name].present?
      @users = @organization.users.where('name LIKE ?', "%#{params[:name]}%")#belongingに紐づくユーザだけを検索したい
      #@users = User.where('name LIKE ?', "%#{params[:name]}%")#user全員から検索する記述
    else
      @users = User.none
    end
  end


end
