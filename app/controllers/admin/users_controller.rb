class Admin::UsersController < User::ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:new, :create]
  before_action :admin_user, only: [:edit, :update, :destroy]
    def new
     @user = User.new
    end
    
    def index
       @users = User.all
    end
    
    def create
        @user = User.new(user_params)
       
        if @user.save
            redirect_to admin_user_path(@user)
        else
            render 'new'
        end
    end
    def show
        @user = User.find(params[:id])
    end
        
    def edit
        
    end
    
    def update
        if @user.update(user_params)
			redirect_to admin_user_path(@user)
		else
			render 'edit'	
	    end
    end

    def destroy
        @user.destroy
        redirect_to admin_users_path
    end
    
private
  def user_params
    params.require(:user).permit(:user_id, :email, :password)
  end
  def set_user
		@user = User.find params[:id]	
  end
   
   def admin_user
       redirect_to admin_users_path unless current_user.admin
   end 
end
