class AdminsController < ApplicationController

  def delete
    Spam.find_by_rant_id(params[:format]).destroy
    Rant.delete(params[:format])
    redirect_to :back
  end

  def resolve
    Spam.find_by_rant_id(params[:format]).update_attributes(resolved: true)
    redirect_to :back
  end

end