module BookmarksHelper
     def book_user_trick(trick)
        # return true or false
        book = current_user.user_tricks.pluck(:trick_id).include?(trick.id)
        if book
            "book"
        else
            ""
        end
      end
    def get_user_bookmark(trick)
        current_user.bookmarks.find_by(trick: trick)
    end
end
