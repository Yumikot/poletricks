class ArticlesController < ApplicationController
    before_action :authenticate_user!
    def new
        @article = Article.new
    end
    
    def index
       @articles = Article.all
    end
    
    def create
          @article = Article.new(article_params)
          @article.user = current_user
		if @article.save
			redirect_to article_path(@article)
		else
			render 'new'
		end
    end
    def show
        @article = Article.find(params[:id])
    end
    def edit
        if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'	
	    end
    end
    def destroy
        @article.destroy
    	redirect_to articles_path
    end
private
   def article_params
        params.require(:article).permit(:title, :text, :created_at)
   end
    
end
