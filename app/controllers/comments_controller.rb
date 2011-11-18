class CommentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # PUT /comments/1
  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    redirect_to(@comment.commentable,
                :notice => 'Comment was successfully updated.') 
  end
  
  # DELETE /comments/1
  def destroy
    @comment = Comment.find(params[:id])
    commentable = @comment.commentable
    @comment.destroy
    redirect_to commentable
  end  
end
