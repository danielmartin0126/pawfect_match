class MessagesController < ApplicationController
    before_action :get_message, only: [:show, :edit, :update]

    def index        
        @messages = Message.where("sender_id = ? and receiver_id = ? OR sender_id = ? and receiver_id = ?" , params[:user_id], session[:user_id],session[:user_id], params[:user_id])
    #     @messages = Message.all
    #     @pets = User.all
    #    if params[:sender_id] || params[:receiver_id]
    #      @messages = @messages.select do |message|
    #        message.sender_id == session[:user_id] ||  message.receiver_id == session[:user_id]
    #      end
    #     render :index
    #    end
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
        # redirect_to messages_path(:receiver_id => params[:receiver_id], :sender_id => session[:user_id])
        redirect_to controller: 'users', action: 'show', id: params["message"][:receiver_id]

        else
          flash[:errors] = @message.errors.full_messages
                redirect_to controller: 'users', action: 'show', id: params["message"][:receiver_id]
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
