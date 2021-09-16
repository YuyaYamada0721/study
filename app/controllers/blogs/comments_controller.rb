class Blogs::CommentsController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog) }
      else
        format.html { redirect_to blog_path(@blog), notice: '投稿エラー' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end
end
