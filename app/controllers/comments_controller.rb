class CommentsController < ApplicationController

  def create
    @task = Task.find(params[:task_id])
    comment = current_user.comments.new(comment_params)
    comment.task_id = @task.id
    if comment.save
      redirect_to organization_project_task_path(@task.project.organization_id,@task.project_id,@task.id)
    else
      redirect_to organization_project_task_path(@task.project.organization_id,@task.project_id,@task.id)
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
    Comment.find_by(id: params[:id], task_id: params[:task_id]).destroy
    redirect_to organization_project_task_path(@task.project.organization_id,@task.project_id,@task.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end