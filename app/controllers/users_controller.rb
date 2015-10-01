class UsersController < ApplicationController
  def new
  	@user = User.new()
  end

  def index
  	@users = User.all
  end

  def create
  	@user = User.create( first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
  	if @user.valid?
  		redirect_to '/users/'	
  	else
  		render '/users/new/'
  	end
  end

  def show
  	# @users = User.all
  	@user = User.find(params[:id])
  	# @users.push(User.find(params[:id]))
  	render '/users/index/'
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    # There HAS to be a better way to do this other than 1X1
  	@user.first_name = params[:first_name]
  	@user.last_name = params[:last_name]
  	@user.email = params[:email]
  	@user.password = params[:password]
  	if @user.valid?
  		@user.save
  		redirect_to '/users/'	
  	else
  		render '/users/new/'
  	end
  end

  def destroy
  	User.delete(params[:id])
  	redirect_to '/users/'
  end

end
