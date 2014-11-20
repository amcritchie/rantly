class RantsController < ApplicationController

  def index
    # @rant = Rant.new
    @latest_rants = Rant.where.not(user_id: current_user, spam: false).reverse
    @spam = Rant.where(spam: true)

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

      Following.where(user_being_followed_id: current_user).each do |following|
        UserMailer.notify_of_rant(User.find(following.user_following_id), current_user, @rant).deliver
      end

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

  def spam
    Rant.find(params[:rant_id]).update_attributes(spam: true)
    redirect_to :back
  end

  def unspam
    Rant.find(params[:rant_id]).update_attributes(spam: false)

    redirect_to :back
  end
end