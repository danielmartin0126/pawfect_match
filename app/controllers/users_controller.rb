class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    before_action :get_user, only: [:show, :edit, :update]

    def index
        @users = User.search(params[:term])
    end

    def results
      @all_species = User.species_list
      @user = User.new
    end

    def show
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to @user
        else
          flash[:errors] = @user.errors.full_messages
          redirect_to new_user_path
        end
    end

    def edit
    end

    def update
        @user.update(user_params)
        redirect_to user_path
    end

    def destroy
        get_user.destroy
        flash[:notice] = "You have deleted your account"
        redirect_to users_path
    end


    private

    def get_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :species, :age, :quote, :fav_food, :gender, :profile_pic, :interests, :term, :password)
    end


end
