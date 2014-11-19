class SessionsController < ApplicationController
  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username].downcase)
    if @user && @user.authenticate(params[:user][:password].downcase)
      if @user.email_confirmed?
        session[:user_id] = @user.id
        flash[:success] = "Welcome back #{current_user.first_name.capitalize}"
        Keen.publish(:login, {:username => params[:user][:username]}) if Rails.env.production?
        Keen.publish(:loginDev, {:username => params[:user][:username]}) if Rails.env.development?

        redirect_to root_path
      else
        @user = User.new()
        flash[:fail] = "Please Confirm your email"
        render :new
      end
    else
      @user = User.new()
      flash[:fail] = "Username/Password is incorrect"
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end