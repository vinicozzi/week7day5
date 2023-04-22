class PostsController < ApplicationController

    before_action :require_signed_in, only: [:edit, :update]

    def show 
        @post = Post.find(params[:id]) 
    end 

    def create
        @post = Post.new(post_params) 
        @post.sub_id= params[:sub_id]
         
        flash[:errors] = @post.errors.full_messages unless @post.save

        redirect_to subs_url(@post.sub_id) 
    end 

    def update 
    end 

    def new
        @post = Post.new 
    end 

    def edit 
    end 

    private 

    def post_params
        params.require(:post).permit(:title)
    end 

end
