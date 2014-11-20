class UserCommentsController < ApplicationController

  def new
    @comment = UserComment.new
  end

  def create

    @comment = UserComment.create(
        commenter_id: current_user.id,
        user_id: params[:user_id],
        comment: params[:user_comment][:comment]
    )

    redirect_to :back
  end
end