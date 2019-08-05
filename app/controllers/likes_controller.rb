class LikesController < ApplicationController
  def create
      # binding.pry
      redirect_to logon_path and return unless current_user.present?
      @post = Post.find(params[:id])
      if @post.present?
       if current_user.likes.find_by_post_id(@post.id).present?
         current_user.likes.find_by_post_id(@post.id).destroy
         redirect_to posts_path
       else  
        @like = current_user.likes.new(post: @post)
        @like.save
        redirect_to posts_path
      end  
    end
  end
end