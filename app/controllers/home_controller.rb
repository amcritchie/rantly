class HomeController < ApplicationController
  def index
    @rant = Rant.new
    @my_rants = Rant.where(user_id: current_user).reverse.first(3)
    @latest_rants = Rant.all.reverse.first(5)
  end
end
