class TopController < ApplicationController
    def index
        @q = Trick.ransack(params[:q])
        @trick = @q.result(distinct: true)
        
    end
end
