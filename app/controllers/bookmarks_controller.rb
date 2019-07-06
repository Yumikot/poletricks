class BookmarksController < ApplicationController
    before_action :authenticate_user!
     layout 'nofooter'
    def create
        @trick = Trick.find(params[:trick_id])
        @bookmark = current_user.bookmarks.build(trick: @trick)
        @bookmark.save
        
        # if @bookmark.save
        #  redirect_to bookmarks_path
        # else
        #  redirect_to bookmarks_path
        # end
        
        respond_to do |format|
         format.html
         format.js 
        end
    end
    
    def index
        @user = current_user
        @bookmarks = current_user.bookmarks
    end
    
    def destroy
         @trick = Trick.find(params[:trick_id])
         @bookmark = Bookmark.find(params[:id])
         @bookmark.destroy
       respond_to do |format|
         format.html
          format.js 
      end
    end
end
