class UserTricksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trick
  def create
    @trick = Trick.find(params[:trick_id])
    @usertrick = current_user.user_tricks.create(trick: @trick)
    #redirect_back(fallback_location: root_path, notice: 'UserTrickに保存されました')
    @usertrick.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
     @trick = Trick.find(params[:trick_id])
    @user_trick = UserTrick.find(params[:id])
    @user_trick.destroy
    #redirect_back(fallback_location: root_path, notice: 'キャンセルされました')
  
    
     respond_to do |format|
      format.html
      format.js
     end
    
    end
  
  
  def set_trick
    @trick = Trick.find(params[:trick_id])
  end
end
