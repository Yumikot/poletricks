class TricksController < ApplicationController
  before_action:authenticate_user!, only: [:show, :create, :new]
  def index
    @q = Trick.ransack(params[:q])
    if params[:q]
      @tricks = @q.result(distinct: true)
    else
      @tricks = Trick.all
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
  
  private
  def trick_params
    params.require(:trick).permit(:title, :image, :video, :video_id, :user_id, { :category_ids=> [] })
  end
end
  

