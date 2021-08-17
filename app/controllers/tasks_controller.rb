class TasksController < ApplicationController

  def new
    @task = Task.new(project_id:params[:project_id])
  end

  def index
    @task = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
   @task = Task.new(task_params)
   @task.user_id = current_user.id
   @task.project_id = params[:organization_id]
    if @task.save
      redirect_to organization_project_task_path(@task.project.organization_id,@task.project_id,@task.id)
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
    if current_user.id == @task.user_id
      render :edit
    else
      redirect_to task_path(@task)
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to task_path(@task)
  end

  def task_params
    params.require(:task).permit(:name, :detail, :man_hour, :deadline, :status)
  end

end