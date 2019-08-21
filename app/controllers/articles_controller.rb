class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :admin_user, only: [:edit, :update, :new, :destroy]
     
    def new
        @article = Article.new
    end
    
    def index
      @articles = Article.all.order(created_at: "DESC")
     
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
    end 
    def update
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
        params.require(:article).permit(:title, :text, :created_at, :image, :image_cache, :remove_image)
   end
   def set_article
		@article = Article.find params[:id]	
   end
   
   def admin_user
       redirect_to articles_path unless current_user.admin
   end
end
