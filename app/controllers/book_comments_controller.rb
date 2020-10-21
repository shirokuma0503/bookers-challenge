class BookCommentsController < ApplicationController

    before_action :authenticate_user!

    def create
        @book = Book.find(params[:book_id]) #コメントする投稿id
        #@book_comment = current_user.book_comments.new(book_comment_params)に省略できる。 誰が投稿、コメントのデータ
        @comment = BookComment.new(book_comment_params)
        @comment.user_id = current_user.id
        @comment.book_id = @book.id #どの投稿にコメントするか
        @comment_new = BookComment.new
        if @comment.save
        else
            @user = @book.user
            render 'books/show'
        end
    end

    def destroy
        comment = BookComment.find(params[:id])
        @book = Book.find(params[:book_id]) #詳しくidを指定
        @comment_new = BookComment.new
        comment.destroy
    end

    private

    def book_comment_params
        params.require(:book_comment).permit(:comment)
    end

end
