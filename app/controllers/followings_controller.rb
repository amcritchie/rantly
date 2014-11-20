class FollowingsController < ApplicationController

  # respond_to(:json)

  def index
    @rant = Rant.new
    @followings = Following.where(user_following_id: current_user.id)
  end

  def create

    @following = Following.new(
        user_following_id: current_user.id,
        user_being_followed_id: params[:id]
    )

    if @following.save
      flash[:success] = "User Followed"
    end
    redirect_to root_path
  end

  def destroy
    follower = Following.where(user_following_id: current_user.id, user_being_followed_id: params[:id])
    follower.delete_all
    redirect_to :back
  end
end