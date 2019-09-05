class PostsController < ApplicationController
    before_action :find_post, only: [:edit, :update, :show, :like]

    def like
        @post.likes += 1
        @post.save
        redirect_to @post
    end

    def show

    end

    def new
        @post = Post.new
    end

    def create
        post = Post.new(post_params)
        post.likes = 0
        if post.valid?
            post.save
            redirect_to post
        else
            flash[:errors] = post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit

    end

    def update
        @post.update(post_params)
        redirect_to @post
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
    
end
