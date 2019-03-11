class CommentsController < ApplicationController
    def create
        @trick = Trick.find(params[:trick_id])
        @comment = @trick.comments.create(params[:comment])
        redirect_to trick_path(@trick)
    end
end
