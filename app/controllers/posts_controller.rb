class PostsController < ApplicationController
    before_action :get_post, only: [:show, :edit, :update]

    def index
        @posts = Post.all
    end

    def show
    
    end 

    def new
        @post = Post.new
        @users = User.all
    end

    def create
        @post = Post.create(post_params)
        @user = User.find(params[:post][:animal_id])
        redirect_to user_path(@user)
    end

    def edit
    end

    def update 
        @post.update(post_params)
        redirect_to post_path
    end
    
    def destroy
        get_post.destroy
        redirect_to posts_path
    end

    private

    def get_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:animal_id, :image_url, :caption)
    end

end
