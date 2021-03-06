class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!
	def create

    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    #redirect_back(fallback_location: root_path)
    #redirect_to post_path(@post)

  end
  def destroy

    @comment = @post.comments.find(params[:id])
    @comment_id = @comment.id
    @comment.destroy
    #redirect_to post_path(@post)
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end

end
