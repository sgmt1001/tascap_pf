class TasksController < ApplicationController
  before_action :task_user, only: [:show, :edit]

  def new
    @task = Task.new(project_id: params[:project_id])
    members = Member.where( project_id: params[:project_id] )
    @users = []
    members.each do |member|
      user = User.find(member.user_id)
      @users.push(user.name)
    end
  end

  def index
    @user = current_user
    @task = Task.where(person: @user.name)
  end

  def show
    @task = Task.find(params[:id])
    @user = @task.user
    @comment = Comment.new
    # @comment_reaction = Comment.find_by(task_id: @task.id,user_id: @user.id)
  end

  def create
   @task = Task.new(task_params)
   @task.user_id = current_user.id
   @task.project_id = params[:project_id]
   members = Member.where( project_id: params[:project_id] )
    @users = []
    members.each do |member|
      user = User.find(member.user_id)
      @users.push(user.name)
    end
    if @task.save
      redirect_to organization_project_task_path(@task.project.organization_id,@task.project_id,@task.id)
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
     members = Member.where( project_id: @task.project_id )
     @users = []
     members.each do |member|
       user = User.find(member.user_id)
       @users.push(user.name)
     end
    if Member.exists?(project_id: @task.project_id)
      render :edit
    else
      redirect_to organization_project_task_path(@task.project.organization_id,@task.project_id,@task.id)
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to organization_project_task_path(@task.project.organization_id,@task.project_id,@task.id)
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to organization_project_path(@task.project.organization_id,@task.project_id)
  end

  def task_user#プロジェクトに参加しているユーザだけがアクセスできるようにするための記述
    @task = Task.find(params[:id])
    @user = current_user
    unless Belonging.find_by(organization_id: @task.project.organization_id) && Member.find_by(project_id: @task.project_id)
      redirect_to root_path
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :detail, :man_hour, :deadline, :status, :person)
  end

end