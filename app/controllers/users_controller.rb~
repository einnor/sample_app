class UsersController < ApplicationController
  def new
  	@title = "Sign up"
  end

  def show
  	@user = User.find(params[:id])
  	@title = @user.name
  	#@post = Post.new(params.require(:post).permit(:title, :content))
  end

end
