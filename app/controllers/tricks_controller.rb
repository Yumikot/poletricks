class TricksController < ApplicationController
  before_action:authenticate_user!
  def index
    @tricks = Trick.all
  end
  
  def new
    @trick = Trick.new
  end
  
  def create
    @trick = Trick.new(trick_params)
    if @trick.save
    redirect_to trick_path(@trick)
   else
     render 'new'
   end
  end
  
  def show
    @trick = Trick.find params[:id]
  
  end
  
  private
  def trick_params
    params.require(:trick).permit(:title, :image, :video, :video_id, :category_id, :category_name)
  end
  
end
  

