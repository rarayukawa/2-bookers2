class FavoritesController < ApplicationController
before_action :authenticate_user!
before_action :set_book

  def create
    # Favorite.create(user_id: current_user.id, book_id: params[:id])
    @book = Book.find(params[:book_id])
    @favorites = @book.favorites.all
    @favorite = current_user.favorites.build(book_id: params[:book_id])
    @favorite.save
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    # Favorite.find_by(user_id: current_user.id, book_id: params[:id]).destroy
    @book = Book.find(params[:book_id])
    @favorite = Favorites.find_by(book_id: params[:book_id], user_id: current_user.id)
    @favorite.destroy
    # redirect_back(fallback_location: root_path)
  end

  private
  def set_book
    @book = Book.find(params[:book_id])
  end

end
