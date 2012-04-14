class UsersController < ApplicationController

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'User was successfully created.' 
      redirect_to @user
    else
      flash[:error] = 'Oops, there was a problem creating the user.'
      render 'new'
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to @user
    else
      flash[:error] = 'Oops, there was a problem updating the user.'
      render 'edit'
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end
end
