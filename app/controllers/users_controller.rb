class UsersController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create

    @user = User.new(
        user_params,
    )

    @user.username.downcase!
    @user.first_name.downcase!
    @user.last_name.downcase!
    @user.email.downcase!
    @user.bio.downcase!
    @user.email_confirmed = false
    @user.image_url = "http://www.egotailor.com/product/10472/images/10472design-1.jpg"

    @user.admin = false

    if @user.save

      uuid = SecureRandom.uuid
      confirmation_info = MailConfirmer.create(email: @user.email,uuid: uuid)

      UserMailer.send_welcome(@user, email_confirmer_url(uuid)).deliver

      flash[:success] = "Thank you for registering!"

      Keen.publish(:signups, {:username => current_user.username}) if Rails.env.production?
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
          image: params[:user][:image]
      )
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  def show
    @rant = Rant.new()
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :bio, :rant_frequency, :image_url, :image)
  end
end