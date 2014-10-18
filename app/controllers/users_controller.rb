class UsersController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    user_params.map do |param|
      param[1].downcase
    end
    @user = User.new(
        user_params,
    )

    @user.username.downcase!
    @user.first_name.downcase!
    @user.last_name.downcase!
    @user.bio.downcase!
    @user.image_url = "http://www.egotailor.com/product/10472/images/10472design-1.jpg"
    @user.admin = false

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

  def show
    @rant = Rant.new()
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :rant_frequency, :image_url)
  end
end