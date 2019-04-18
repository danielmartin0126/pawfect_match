class CommentsController < ApplicationController
    before_action :get_comment, only: [:show, :edit, :update]

    def index
        @comments = Comment.all
    end

    def show
     @post = Post.find(@comment.post_id)
    end

    def new
        @comment = Comment.new
        @users = User.all
        @posts = Post.all
    end

    def create
      @comment = Comment.new(comment_params)
      @comment.commenter_id = session[:user_id]
      @comment.save
        if @comment.valid?
          redirect_to post_path(@comment.post_id)
        end
    end

    def edit
        @comment = Comment.find(params[:id])
        @users = User.all
        @posts = Post.all
        @post = Post.find(Comment.find(params[:id]).post_id)
    end

    def update
        @comment.update(comment_params)
        @post = Post.find(Comment.find(params[:id]).post_id)
        redirect_to post_path(@post)
    end

    def destroy
        Comment.find(params[:comment_id]).destroy
        redirect_to post_path(params[:post_id])
    end

    private

    def get_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:commenter_id, :post_id, :comment)
    end

end
