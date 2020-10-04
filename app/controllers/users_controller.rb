class UsersController < ApplicationController

    def index
        @users = User.all
        @book = Book.new
        @user = User.find(current_user.id)
    end

    def show
        @user = User.find(params[:id])
        @book = Book.new
        @books = @user.books #@userにはユーザー情報、そこに紐づいているbooksモデルの本たち

    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.id = current_user.id
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end

    private

    def user_params
        params.require(:user).permit(:profile_image, :name, :introduction)
    end

end
