class UsersController < ApplicationController
    def show
    end
    
    def destroy
        @user.destroy
        redirect_to admin_users_path
    end
    
end
