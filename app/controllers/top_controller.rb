class TopController < ApplicationController
   layout 'nofooter'
  def index
    if user_signed_in?
      redirect_to tricks_path
    end
  end
end
