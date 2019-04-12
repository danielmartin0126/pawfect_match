class RelationshipsController < ApplicationController


    def index
        @relationships = Relationship.all
    end

    def show
        get_relationship
    end

    def new
        @relationship = Relationship.new
        @users = User.all
    end

    def create
        @relationship = Relationship.create(relationship_params)
        @user = User.find(params[:relationship][:user_id])
        @user2 = User.find(params[:relationship][:so_user_id])
        @relationship2 = Relationship.create(user_id: @user2.id, so_user_id: @user.id)
        redirect_to user_path(@user)
    end

    def destroy
        @user = User.find(params[:id])
        get_relationship.destroy
        redirect_to user_path(@user)
    end

    private

    def get_relationship
        @relationship = relationship.find(params[:id])
    end

    def relationship_params
        params.require(:relationship).permit(:user_id, :so_user_id)
    end

end
