class CommentsController < ApplicationController
    def create
        raise params.inspect
        @trick = Trick.find params[:trick_id]
        @comment = @trick.comments.create(comment_params)
        redirect_to trick_path(@trick)
    end
    
    def destroy
        @trick = Trick.find params[:trick_id]
        @comment = @trick.comments.find(params[:id])
        @comment.destroy
        redirect_to trick_path(@trick)
    end
    
 private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
