class HomeController < ApplicationController
  def index
    @rant = Rant.new
  end
end
