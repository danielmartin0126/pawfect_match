class UsersController < ApplicationController
    before_action :get_user, only: [:show, :edit, :update]

    def index
        # @users = User.all
        @users = User.search(params[:term])
        # byebug
    end

    # def search_users
    #     if species[:search]
    #         @users = User.where(species: User[:species][:search])
    #     else
    #         @users = User.all
    #     end
    #     render :ed
    # end
    #
    # def user_search_results
    #   @users = User.search(params[:search])
    # end

    # def search_results
    # #   @search_result = params[:results]
    # #   byebug
    # #   # @users = User.all
    # #   # @users.map do |user|
    # #   #   @user = user.species
    # #   # end
    # end

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
        params.require(:user).permit(:name, :species, :age, :quote, :fav_food, :gender, :profile_pic, :interests, :term)
    end

end
