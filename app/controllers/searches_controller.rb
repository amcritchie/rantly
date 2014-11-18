class SearchesController < ApplicationController

  def show
    @rant = Rant.new

    new_search = Search.new(params[:search_for])
    rants_via_first_name = new_search.find_rants_by_first_name(params[:search_for])
    rants_via_last_name = new_search.find_rants_by_last_name(params[:search_for])
    rants_via_username = new_search.find_rants_by_username(params[:search_for])

    @search = (rants_via_first_name + rants_via_last_name + rants_via_username).uniq

  end

end