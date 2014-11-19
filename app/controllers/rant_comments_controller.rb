class RantCommentsController < ApplicationController

  def new
    @comment = RantComment.new
  end

  def create

    @comment = RantComment.create(
        user_id: current_user.id,
        rant_id: params[:rant_id],
        comment: params[:rant_comment][:comment]
    )

    redirect_to :back
  end

  def destroy

  end
end