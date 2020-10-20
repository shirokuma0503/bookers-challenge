class SearchController < ApplicationController

    def search
        @model = params["search"]["model"]
        @content = params["search"]["content"]
        @method = params["search"]["method"]
        @records = search_for(@model,@content,@method)
    end

    private

    def search_for(model,content,method)
        if model == 'user'
            if method == 'perfect_match'
               User.where('name LIKE ?', '%'+content+'%')
            elsif method == 'forward_match'
               User.where('name LIKE ?', '%'+content)
            elsif method == 'backward_match'
               User.where('name LIKE ?', content+'%')
            elsif method == 'partial'
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
