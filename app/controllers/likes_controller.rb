class LikeController < ApplicationController
    def create
      @like=Like.new(
      user_id: @current_user.id,
      trick_id: params[:trick_id]
       )
      @like.save

      like = {'user_id' => @like.user_id, 'trick_id' => @like.trick_id}
      render json: like
    end
    def destroy
        redirect_to('tricks/#{params[:trick_id]}')
    end
    
end