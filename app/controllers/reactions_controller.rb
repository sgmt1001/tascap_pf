class ReactionsController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    reaction = current_user.reactions.new(comment_id: @comment.id)
    reaction.save
    @task = @comment.task
    
    p @comment
    p @task
    #redirect_to organization_project_task_path(@comment.task.project.organization_id,@comment.task.project_id,@comment.task_id)
     #非同期化に伴い削除
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    reaction = current_user.reactions.find_by(comment_id: @comment.id)
    reaction.destroy
    @task = @comment.task
    #redirect_to organization_project_task_path(@comment.task.project.organization_id,@comment.task.project_id,@comment.task_id)
    #非同期化に伴い削除
  end

end
