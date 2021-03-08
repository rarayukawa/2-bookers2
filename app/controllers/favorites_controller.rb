class FavoritesController < ApplicationController
before_action :set_book

  def create
    # Favorite.create(user_id: current_user.id, book_id: params[:id])
    @book = Book.find(params[:book_id])
    @favorites = Favorite.where(book_id: @book.id)
    @favorite = current_user.favorites.new(book_id: @book.id)
    @favorite.save
  end

  def destroy
    # Favorite.find_by(user_id: current_user.id, book_id: params[:id]).destroy
    @book = Book.find(params[:book_id])
    @favorite = Favorite.find_by(book_id: @book.id, user_id: current_user.id).destroy
    @favorites = Favorite.where(book_id: @book.id)
    # redirect_back(fallback_location: root_path)
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

end
