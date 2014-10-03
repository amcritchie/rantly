class UsersController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(
        username: params[:user][:username],
        password: params[:user][:password],
        first_name: params[:user][:first_name],
        last_name: params[:user][:last_name],
        bio: params[:user][:bio],
        rant_frequency: params[:user][:rant_frequency]
    )

    if @user.save
      flash[:success] = "Thank you for registering!"
      redirect_to root_path
    else
      render :new
    end
  end
end