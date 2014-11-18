class HomeController < ApplicationController
  def index
    @rant = Rant.new
    # @test = User.find(session[:user_id]).username
    if current_user != nil
      @mentions = Rant.where('rant LIKE :rant',{:rant => "%@#{current_user.username}%"})
    end
    @my_rants = Rant.where(user_id: current_user).reverse.first(3)
    @latest_rants = Rant.where.not(user_id: current_user).reverse.first(5)
  end
end
