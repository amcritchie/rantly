class RantsController < ApplicationController

  def index
    # @rant = Rant.new
  end

  def show
    @rant = Rant.find(params[:id])
    @comment = @rant.rant_comments.new
    @comments = RantComment.where(:rant_id => params[:id])
  end

  def new
    @rant = Rant.new(current_user)
  end

  def create
    @rant = Rant.new(
        user_id: current_user.id,
        title: params[:title],
        rant: params[:rant]
    )
    if @rant.save
      # flash[:success] = "Rant Created"


      Keen.publish(:rant, {:username => current_user.username}) if Rails.env.production?
      redirect_to root_path
    else
      errors = []
           @rant.errors.full_messages.each do |message|
                errors.push(message)
            end

      flash[:fail] = @rant.errors.full_messages.join(', & ')
      redirect_to :back
    end
  end

  def destroy
    rant = Rant.find(params[:id])
    rant.destroy
    flash[:success] = "Rant deleted"
    redirect_to root_path
  end
end