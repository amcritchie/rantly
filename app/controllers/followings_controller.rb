class FollowingsController < ApplicationController

  def new
    @following = Following.new
  end

  def create
    @following = Following.new(
        user_following_id: current_user.id,
        user_being_followed_id: params[:user_id]
    )
    if @following.save
      flash[:success] = "User Followed"
    end
    redirect_to root_path
  end

  def destroy
    follower = Following.where(user_following_id: current_user.id, user_being_followed_id: params[:user_id])
    follower.delete_all
    redirect_to root_path
  end
end