class SearchController < ApplicationController

    def search
        @model = params["search"]["model"]
        @content = params["search"]["content"]
        @method = params["search"]["method"]
        @records = search_for(@model,@content,@method) #@user@bookの情報が入っている
    end

    private

    def search_for(model,content,method)
        if model == 'user'
            if method == 'perfect_match' #完全一致
               User.where('name LIKE ?', '%'+content+'%') #モデル名.where('カラム名 LIKE?', 条件に合わせた中身)
            elsif method == 'forward_match' #前方一致
               User.where('name LIKE ?', '%'+content)
            elsif method == 'backward_match' #後方一致
               User.where('name LIKE ?', content+'%')
            elsif method == 'partial' #部分一致
               User.where('name LIKE ?', '%'+content+'%')
            end
        else
            if method == 'perfect_match'
               Book.where('title LIKE ?', '%'+content+'%')
            elsif method == 'forward_match'
               Book.where('title LIKE ?', '%'+content)
            elsif method == 'backward_match'
               Book.where('title LIKE ?', content+'%')
            elsif method == 'partial'
               Book.where('title LIKE ?', '%'+content+'%')
            end
        end
    end

end
