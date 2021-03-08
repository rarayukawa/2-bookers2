class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.book_id = @book.id
    @book_comment.save
      render :index
      # redirect_to book_path(@book.id)

  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.find(params[:id])
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
      render :index
    # redirect_to book_path(params[:book_id])

  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end