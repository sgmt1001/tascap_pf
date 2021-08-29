class ReactionsController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    reaction = current_user.reactions.new(comment_id: @comment.id)
    reaction.save
    redirect_to organization_project_task_path(@comment.task.project.organization_id,@comment.task.project_id,@comment.task_id)
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    reaction = current_user.reactions.find_by(comment_id: @comment.id)
    reaction.destroy
    redirect_to organization_project_task_path(@comment.task.project.organization_id,@comment.task.project_id,@comment.task_id)
  end

end
