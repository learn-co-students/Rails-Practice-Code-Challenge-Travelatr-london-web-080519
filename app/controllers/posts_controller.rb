class PostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update, :add_like]

    def new
        @post = Post.new
    end

    def create
        post = Post.create(post_params)

        if post.valid?
            redirect_to post
        else
            flash[:errors] = post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def show
        
    end

    def add_like
        @post.likes += 1
        @post.save
        redirect_to @post
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end

end