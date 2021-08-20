class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def index
    @project = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.organization_id = params[:organization_id]
    if @project.save
      Member.create(project_id:@project.id,user_id:current_user.id)#create実行時にproject作成者をmemberに自動で追加
      redirect_to organization_project_path(@project.organization_id,@project.id)
    else
      render 'index'
    end
  end

  def edit
    @project = Project.find(params[:id])
    if current_user.id == @project.user_id
      render :edit
    else
      redirect_to organization_project_path(@project.organization_id,@project.id)
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to organization_project_path(@project.organization_id,@project)
    else
      render "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @organization = @project.organization_id
    @project.destroy
    redirect_to organization_path(@organization)
  end

  def invite
    @invite = Member.create(project_id:params[:id],user_id:params[:user_id])
    @invite.save
    @project = Project.find(params[:id])
    @organization = @project.organization_id
    redirect_to organization_project_path(@organization,@project.id)
  end

  def set_spendable
    @member = Member.find(params[:id])
  end

  def set_spendable_update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to organization_project_path(@member.project.organization.id,@member.project.id)
    else
      render "set_spendable"
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :overview)
  end

  def member_params
    params.require(:member).permit(:spendable_hour)
  end

end
