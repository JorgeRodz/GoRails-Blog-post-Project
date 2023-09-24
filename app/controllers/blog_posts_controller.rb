class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @blog_posts = BlogPost.all
  end

  def show
    # @blog_post = BlogPost.find(params[:id])
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)

    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # We need to find the blog post we want to edit, and store to the instance variable @blog_post
    #  in order to display the blog post title and body in the form
    # @blog_post = BlogPost.find(params[:id])
  end

  def update
    # @blog_post = BlogPost.find(params[:id])

    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy

    redirect_to root_path
  end

  private

  # Strong Parameters - to protect against mass assignment. This is a mandatory step in Rails 4 and above.
  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
