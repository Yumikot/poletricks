class Admin::TricksController < Admin::ApplicationController
  before_action:authenticate_user!, only: [:index, :show, :create, :new]
  before_action :admin_user, only: [:edit, :update, :new, :destroy]
  before_action :set_trick, only: [ :edit, :update, :destroy]
  impressionist :actions=>[:show,:index]
  
  def index
     @trick = Trick.all
     @page_viewed = Trick.order('impressions_count DESC')
  end
  
  def new
    @trick = Trick.new
  end
  
  def create
    @trick = Trick.new(trick_params)
    @trick.user = current_user
    if @trick.save
     redirect_to trick_path(@trick)
    else
     render 'new'
    end
  end
  
  def show
    @trick = Trick.find(params[:id])
    impressionist(@trick, nil, :unique => [:session_hash])
  end
  
  def edit
  end 
  
  def update
      if @trick.update(trick_params)
			redirect_to tricks_path
	  else
			render 'edit'	
	  end
  end
  
  def destroy
      @trick.destroy
      redirect_to tricks_path
  end
    
  private
      def trick_params
        params.require(:trick).permit(:title, :image, :video, :video_id, :user_id, :ja_title, :impressions_count,{ :category_ids=> [] })
      end
      def admin_user
           redirect_to tricks_path unless current_user.admin
      end
      def set_trick
    		  @trick = Trick.find params[:id]	
      end
end
  