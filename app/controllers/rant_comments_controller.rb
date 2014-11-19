class RantCommentsController < ApplicationController

  def new
    @comment = RantComment.new
  end

  def create

    redirect_to :back
  end

  def destroy

  end
end