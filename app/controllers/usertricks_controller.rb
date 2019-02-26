class UsertricksController < ApplicationController
  before_action :authenticate_user!
  before_action :logged_in_user
  def create
    @usertrick = UserTrick.create(ser_id: current_user.id, trick_id: params[:trick_id])
    @usertricks= UserTrick.where(trick_id: params[:trick_id])
    @tricks = Trick.all
  end

  def destroy
    usertrick= UserTrick.find_by(user_id: current_user.id, trick_id: params[:trick_id])
    usertrick.destroy
    @trick = UserTrick.find(params[:trick_id])
    @trick.unlike(current_user)
  end
end
