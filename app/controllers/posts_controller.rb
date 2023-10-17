class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
      if params[:search] == nil
          @posts= Post.all
        elsif params[:search] == ''
          @posts= Post.all
        else
          #部分検索
          @posts = Post.where("america LIKE ? ",'%' + params[:search] + '%')
        end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
    
  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to action: :index
  end
  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to :action => "show", :id => post.id
    else
      redirect_to :action => "new"
    end
  end
  def america
    @posts = Post.all
  end
  
  def canada
    @posts = Post.all
  end
  
  def uk
    @posts = Post.all
  end

  def aus
    @posts = Post.all
  end

  def sf
    @posts = Post.all
  end

  def ny
    @posts = Post.all
  end
  
  private
  def post_params
    params.require(:post).permit(:content, :country, :city, :school, :image,:lat,:lng)
  end
end

