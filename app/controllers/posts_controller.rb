class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")#grabs all posts from model and orders by index no.(descending order)
    #assigns all to posts variable
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)#security measure which rails implements for us
    if @post.save#if post save was successful, redirect to  @post show page
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
  end

  def enquire
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end



  private

  def find_post
    @post = Post.find(params[:id])#find each post based on auto generated id
  end

  def post_params
    params.require(:post).permit(:title, :address, :rv, :body)
  end
end
