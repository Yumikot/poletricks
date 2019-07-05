class TricksController < ApplicationController
  before_action:authenticate_user!, only: [:index, :show, :create, :new]
  before_action :admin_user, only: [:edit, :update, :new, :destroy]
  before_action :set_trick, only: [ :edit, :update, :destroy]
  impressionist :actions=>[:show,:index]
  layout 'nofooter'
  
  def index
    @q = Trick.ransack(params[:q])
    if params[:q]
      @tricks = @q.result(distinct: true).paginate(page: params[:page],per_page:6)
    else
       @tricks = Trick.paginate(page: params[:page],per_page:6)
    end
    
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
    @trick = Trick.includes(:user).find(params[:id])
    @categories = @trick.categories
    @category_tricks = CategoryTrick.where(category_id: @categories).where.not(trick_id: @trick).limit(3)
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
        params.require(:trick).permit(:title, :image, :video, :video_id, :user_id, :ja_title, { :category_ids=> [] })
      end
      def admin_user
        redirect_to tricks_path unless current_user.admin
      end
      def set_trick
    	 @trick = Trick.find params[:id]	
      end
end
  

