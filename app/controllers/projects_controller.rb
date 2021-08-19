class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def index
    @project = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.organization_id = params[:organization_id]
    if @project.save
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
    @project.destroy
    redirect_to organization_projects_path(@project.organization_id)
  end

  def project_params
    params.require(:project).permit(:name, :overview)
  end

end
