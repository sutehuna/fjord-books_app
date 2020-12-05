# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save!
      redirect_back(fallback_location: '/', notice: t('controllers.common.notice_create', name: Comment.model_name.human))
    else
      redirect_back(fallback_location: '/')
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: '/')
  end

  def comment_params
    params.require(:comment).permit(:commentable_type, :commentable_id, :user_id, :comment, :user_id)
  end
end
