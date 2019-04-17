class MessagesController < ApplicationController
    before_action :get_message, only: [:show, :edit, :update]

    def index
        @messages = Message.all
    end

    def show
     @message = Message.find(message_params)
    end

    def new
        @message = Message.new
        @users = User.all
    end

    def create
        @message = Message.create(message_params)
        if @message.valid?
        redirect_to message_path(@message)
        else
          flash[:errors] = @message.errors.full_messages
          redirect_to new_supply_path
    end

    def edit
        @users = User.all
        get_message
    end

    def update
        @message.update(message_params)
        redirect_to messages_path
    end

    def destroy
        get_message.destroy
        redirect_to messages_path
    end

    private

    def get_message
        @message = Message.find(params[:id])
    end

    def message_params
        params.require(:message).permit(:sender_id, :receiver_id, :msg)
    end



end
