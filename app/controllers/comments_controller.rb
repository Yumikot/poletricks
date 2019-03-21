class CommentsController < ApplicationController
    def create
        @trick = Trick.find params[:trick_id]
        # @trick.comments.create(comment_params)
        @comment = @trick.comments.build(comment_params)
         @comment.user = current_user
            if @comment.save
              redirect_to trick_path(@trick)
            else
              render "tricks/show"
            end
    end
    
    def destroy
        @trick = Trick.find params[:trick_id]
        @comment = @trick.comments.find(params[:id])
        @comment.destroy
        redirect_to trick_path(@trick)
    end
    
private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :trick_id)
  end
end
