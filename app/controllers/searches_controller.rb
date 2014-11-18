class SearchesController < ApplicationController

  def show
    @rant = Rant.new

    searching_for = params[:search_for].downcase

    new_search = Search.new(searching_for)
    rants_via_first_name = new_search.find_rants_by_first_name(searching_for)
    rants_via_last_name = new_search.find_rants_by_last_name(searching_for)
    rants_via_username = new_search.find_rants_by_username(searching_for)

    @search = (rants_via_first_name + rants_via_last_name + rants_via_username).uniq

  end

end