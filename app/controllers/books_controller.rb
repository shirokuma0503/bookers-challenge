class BooksController < ApplicationController

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
        redirect_to book_path(@book), notice: 'Book was successfully created.' #詳細表示画面へ
      else
        @books = Book.all #renderでindexページを呼び出すなら、indexで定義されている変数も一緒に持ってこないと表示されない
        @user = User.find(current_user.id)
        render "index"
      end
  end

  def index
      @books = Book.all
      @user = User.find(current_user.id) #ログインしているユーザー
      @book = Book.new
  end

  def show
      @book = Book.find(params[:id])
      @book_new = Book.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_params
      params.require(:book).permit(:title, :body)
  end

end
