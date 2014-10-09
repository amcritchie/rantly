class RantsController < ApplicationController

  def index
    # @rant = Rant.new
  end

  def new
    @rant = Rant.new(current_user)
  end

  def create
    Rant.create(
        user_id: current_user.id,
        title: params[:rant][:title],
        rant: params[:rant][:rant]
    )
    flash[:success] = "Rant Created"
    redirect_to root_path
  end
end