class UserTricksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trick
  def create
    @usertrick = current_user.user_tricks.create(trick: @trick)
    redirect_back(fallback_location: root_path, notice: 'UserTrickに保存されました')
  end

  def destroy
    @user_trick = UserTrick.find(params[:id])
    @user_trick.destroy
    redirect_back(fallback_location: root_path, notice: 'キャンセルされました')
    # user_trick= UserTrick.find_by(user_id: current_user.id, trick_id: params[:trick_id])
    # user_trick.destroy
    # @trick = UserTrick.find(params[:trick_id])
    # @trick.unlike(current_user)
  end
  
  def set_trick
    @trick = Trick.find(params[:trick_id])
  end
end
