class SpamsController < ApplicationController

  def create
    @spam = Spam.create(
        :rant_id => params[:rant_id],
        :resolved => 'false'
    )
    redirect_to :back
  end
end