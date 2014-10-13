class SessionsController < ApplicationController
  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome back #{current_user.first_name}"
      redirect_to root_path
    else
      @user = User.new()
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end