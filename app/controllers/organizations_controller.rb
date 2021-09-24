class OrganizationsController < ApplicationController
  before_action :belonging_user, only: [:show, :edit, :belonging,]

  def new
    @organization = Organization.new
  end

  def index
    @user = current_user
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.user_id = current_user.id
    if @organization.save
      Belonging.create(organization_id:@organization.id,user_id:current_user.id)#create実行時にorganization作成者をbelongingに自動で追加
      redirect_to organization_path(@organization)
    else
      render 'new'
    end
  end

  def edit
    @organization = Organization.find(params[:id])
    if current_user.id == @organization.user_id
      render :edit
    else
      redirect_to organization_path(@organization)
    end
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update(organization_params)
      redirect_to organization_path(@organization)
    else
      render "edit"
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to organizations_path
  end

  def belonging
    @organization = Organization.find(params[:id])
  end

  def invite
    @invite = Belonging.create(organization_id:params[:id],user_id:params[:user_id])
    @organization = Organization.find(params[:id])
    @invite.save
    redirect_to organization_belonging_path(@organization)
  end

  def invite_destroy
    @invite = Belonging.find_by(organization_id:params[:id],user_id:params[:user_id])
    @invite.destroy
    @organization = Organization.find(params[:id])
    redirect_to organization_belonging_path(@organization)
  end

  def belonging_user#組織に参加しているユーザだけがアクセスできるようにするための
    @organization = Organization.find(params[:id])
    @user = current_user
    unless Belonging.find_by(organization_id: @organization.id,user_id: @user.id)
      redirect_to root_path
    end
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :introduction)
  end

end
