class TricksController < ApplicationController
  def new
  end
  
  def create
    @trick = Trick.new(trick_params)
    @trick.save
    redirect_to @trick
  end
  
  def show
    @trick = Trick.find(params[:id])
    
  end
  
  def index
    @tricks = Trick.all
  end
  
  
  
  private
  def trick_params
    params.require(:trick).permit(:title, :image, :video)
  end
  
  
end
