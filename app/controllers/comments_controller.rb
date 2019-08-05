class CommentsController < ApplicationController

  def new
    redirect_to logon_path and return unless current_user.present?
    @post = Post.find(params[:id])
    @comments = @post.user_comments.includes(:user)
  end

  def create
    redirect_to logon_path and return unless current_user.present?
    @post = Post.find(params[:id])
    content = params[:comment].values
    if content[0].present? == true
    @comment = current_user.user_comments.new(post: @post, comments: content[0]) 
    redirect_to comment_path if @comment.save
    else
    flash[:danger] = "Comment should not be empty"
    redirect_to comment_path
    end

  end

  def show
    comments=User_comment.new
  end

end
  