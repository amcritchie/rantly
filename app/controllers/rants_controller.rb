class RantsController < ApplicationController

  def index
    # @rant = Rant.new
  end

  def new
    @rant = Rant.new(current_user)
  end

  def create
    @rant = Rant.new(
        user_id: current_user.id,
        title: params[:rant][:title],
        rant: params[:rant][:rant]
    )
    if @rant.save
      flash[:success] = "Rant Created"
    else
      flash[:fail] = "Rant must be at least 140 characters"
    end
    redirect_to root_path
  end
end