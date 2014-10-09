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
        rant_frequency: params[:user][:rant_frequency],
        image_url: "http://www.egotailor.com/product/10472/images/10472design-1.jpg"
    )

    if @user.save
      flash[:success] = "Thank you for registering!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.id == params[:id].to_i
      user = User.find(params[:id])
      user.update(
          username: params[:user][:username],
          first_name: params[:user][:first_name],
          last_name: params[:user][:last_name],
          bio: params[:user][:bio],
          rant_frequency: params[:user][:rant_frequency],
          image_url: params[:user][:image_url]
      )
      redirect_to root_path
      # , notice: "Information updated successfully"
    else
      redirect_to :back
    end
  end
end