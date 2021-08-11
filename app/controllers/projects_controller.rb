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
      redirect_to organizations_path
    else
      #@project = Project.all
      render 'index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def project_params
    params.require(:project).permit(:name, :overview)
  end

end
