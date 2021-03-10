class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit, :create]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @following_users = current_user.following_user
    @follower_users = current_user.follower_user
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

    def follower
      @user = User.find(params[:id])
      @users = @user.follower
    end

    def followed
      @user = User.find(params[:id])
      @users = @user.followed
    end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render action: :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def zipedit
  params.require(:user).permit(:postcode, :prefecture_name, :address_city, :address_street, :address_building)
  end
end
