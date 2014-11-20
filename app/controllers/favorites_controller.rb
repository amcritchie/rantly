class FavoritesController < ApplicationController

  respond_to(:json)

  def index
    @rant = Rant.new
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.new(
        user_id: current_user.id,
        rant_id: params[:rant_id]
    )
    if @favorite.save
      flash[:success] = "Rant Favorited"
    end
    redirect_to root_path
  end

  def destroy
    favorite = Favorite.where(user_id: current_user.id, rant_id: params[:rant_id])
    favorite.delete_all
    flash[:fail] = "Rant Removed"
    redirect_to :back
  end
end