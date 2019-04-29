class PagesController < ApplicationController
  def home
  	@users=User.all
  end
  def personal
    @user = current_user
    @posts=@user.posts
  end
  def tabl
    @users = User.all
  end
  def searcher
    @results = Post.search(params[:search], :order => 'created_at DESC')
  end
  def custumizer
  end
end
