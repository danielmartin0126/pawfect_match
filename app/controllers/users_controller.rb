class UsersController < ApplicationController
    before_action :get_user, only: [:show, :edit, :update]

    def index
        @users = User.search(params[:search])
        # byebug
    end

    # def search_users
    #     if params[:search]
    #         @users = User.search(params[:search])
    #     else 
    #         @users = User.all
    #     end
    #     render :index
    # end

    def show
        @users = User.all
    end 

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        redirect_to user_path(@user)
    end

    def edit
    end

    def update 
        @user.update(user_params)
        redirect_to user_path
    end
    
    def destroy
        get_user.destroy
        redirect_to users_path
    end

    def filtered

    end

    private

    def get_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :species, :age, :quote, :fav_food, :gender, :profile_pic, :interests, :search)
    end

end
