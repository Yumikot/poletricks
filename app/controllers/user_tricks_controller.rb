class UserTricksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trick
  def create
    @usertrick = current_user.user_tricks.create(trick: @trick)
    redirect_back(fallback_location: root_path, notice: 'UserTrickに保存されました')
    @bookmark = current_user.bookmarks.create(trick_id: params[:trick_id])
    @trick = Trick.find(params[:trick_id])
    
    #respond_to do |format|
      #format.html
      #format.js
    #end
  end

  def destroy
    @user_trick = UserTrick.find(params[:id])
    @user_trick.destroy
    redirect_back(fallback_location: root_path, notice: 'キャンセルされました')
  
    
     #respond_to do |format|
      #format.html
      #format.js
    #end
    
    end
  
  
  def set_trick
    @trick = Trick.find(params[:trick_id])
  end
end
