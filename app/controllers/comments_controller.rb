class CommentsController < ApplicationController

  def create
    @task = Task.find(params[:task_id])
    comment = current_user.comments.new(comment_params)
    comment.task_id = @task.id
    comment.save
    redirect_to organization_project_task_path(@task.project.organization_id,@task.project_id,@task.id)
  end

  def destroy
    Comment.find_by(id: params[:id], task_id: params[:task_id]).destroy
    redirect_to organization_project_task_path(@task.project.organization_id,@task.project_id,@task.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end