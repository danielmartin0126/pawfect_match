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
        @so_user = User.find(params[:user_id])
        @user = User.find(session[:user_id])
        @relationship = Relationship.new(user_id: @user.id, so_user_id: @so_user.id)
        if @relationship.valid?
            @relationship = Relationship.create(user_id: @user.id, so_user_id: @so_user.id)
            @relationship2 = Relationship.create(user_id: @so_user.id, so_user_id: @user.id)
            redirect_to user_path(@user)
        else
            flash[:errors] = @relationship.errors.full_messages
            redirect_to user_path(@so_user)
        end
    end

    def destroy
        @user = User.find(params[:so_user_id])
        current_user = session[:user_id]
        @relationship1 = Relationship.find_by(user_id: current_user, so_user_id: @user.id)
        @relationship2 = Relationship.find_by(user_id: @user.id, so_user_id: current_user)
        @relationship1.destroy
        @relationship2.destroy

        redirect_to user_path(current_user)
    end

    private

    def get_relationship
        @relationship = relationship.find(params[:id])
    end

    def relationship_params
        params.require(:relationship).permit(:user_id, :so_user_id)
    end



end
