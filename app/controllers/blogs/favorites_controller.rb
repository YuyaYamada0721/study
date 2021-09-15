class Blogs::FavoritesController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    Favorite.create(user_id: current_user.id, blog_id: @blog.id)
    redirect_to blog_path(@blog), notice: 'お気に入り追加！'
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @favorite = Favorite.find_by(user_id: current_user.id, blog_id: @blog.id)
    if @favorite.destroy
      redirect_to blog_path(@blog), notice: 'お気に入り削除！'
    else
      redirect_to blogs_path, notice: 'お気に入り削除できませんでした。お手数ですが、管理者へ問い合わせて下さい。'
    end
  end
end
