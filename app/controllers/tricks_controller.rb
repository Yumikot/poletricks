class TricksController < ApplicationController
  def index
    @tricks = Trick.all
  end
  
  def new
  end
  
  def create
    @trick = Trick.new(trick_params)
    @trick.save
    redirect_to trick_path(@trick)
  end
  
  def show
    @trick = Trick.find params[:id]
  end
  
  
  
  private
  def trick_params
    params.require(:trick).permit(:title, :image, :video, :video_id)
  end
  
  
end
