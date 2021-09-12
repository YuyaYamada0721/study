class BlogsController < ApplicationController

  def  index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blogs_path, notice: 'ブログを投稿しました'
    else
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update
      redirect_to blogs_path, notice: 'ブログを編集しました'
    else
      rendre :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])

    if @blog.destroy
      redirect_to blogs_path, notice: '削除しました'
    else
      render :index
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
