class BookCommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        @book = Book.find(params[:book_id]) #コメントする投稿id
        #@book_comment = current_user.book_comments.new(book_comment_params)に省略できる。 誰が投稿、コメントのデータ
        @book_comment = BookComment.new(book_comment_params)
        @book_comment.user_id = current_user.id
        @book_comment.book_id = @book.id #どの投稿にコメントするか
        if @book_comment.save
            redirect_to book_path(@book)
        end
    end

    def destroy
        comment = BookComment.find(params[:id])
        comment.destroy
        @book = Book.find(params[:book_id]) #詳しくidを指定
        redirect_to book_path(@book, comment) #何番目のコメントが削除されたか
    end

    private

    def book_comment_params
        params.require(:book_comment).permit(:comment)
    end

end
