class MessagesController < ApplicationController
    before_action :get_message, only: [:show, :edit, :update]

    def index
      @pets = User.all
      @messages = Message.all
      # byebug
      # @messages = Message.where("sender_id = ? and receiver_id = ?", session[:user_id],session[:user_id],)
      if params[:sender_id] || params[:receiver_id]
  @messages = @messages.select do |message|
    message.sender_id == session[:user_id] ||  message.receiver_id == session[:user_id]
end
      render :index
      end
    end

    def show
     @message = Message.find(message_params)
    end

    def new
        @message = Message.new
        @users = User.all
    end

    def create
      @message = Message.new(message_params)
      @message.sender_id = session[:user_id]
      @message.save
      @message.reciever_id = params[:message][:receiver_id]
      # byebug
        if @message.valid?
        redirect_to user_path(@message.receiver_id)
        else
          flash[:errors] = @message.errors.full_messages
          redirect_to new_message_path
        end
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
