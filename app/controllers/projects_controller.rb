class ProjectsController < ApplicationController

  def new
  end

  def index
    @organization = Organization.find(params[:organization_id])
    @organization = current_user.organization.id
  end

  def show
  end

  def create
    @organization = Organization.find(params[:organization_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def organization_params
    params.require(:project).permit(:name, :overview)
  end

end
