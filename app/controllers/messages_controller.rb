class MessagesController < ApplicationController
    before_action :get_message, only: [:show, :edit, :update]

    def index
        @messages = message.all
    end

    def show
     @post = Post.find(@message.post_id)
    end 

    def new
        @message = message.new
        @users = User.all
        @posts = Post.all
    end

    def create
        @message = message.create(message_params)
        @user = User.find(params[:message][:messageer_id])
        @post = Post.find(params["message"]["post_id"])
        redirect_to post_path(@post)
    end

    def edit
    end

    def update 
        @message.update(message_params)
        redirect_to message_path
    end
    
    def destroy
        get_message.destroy
        redirect_to messages_path
    end

    private

    def get_message
        @message = message.find(params[:id])
    end

    def message_params
        params.require(:message).permit(:messageer_id, :post_id, :message)
    end



end
