class Search

  include ActiveModel::Model
  attr_reader :term

  def initialize(search_term)
    @search_term == search_term
  end

  def find_rants_by_first_name(search_term)
    Rant.joins(:user).where('first_name LIKE :first_name',
                            {:first_name => "%#{search_term}%"}
    )
  end

  def find_rants_by_last_name(search_term)
    Rant.joins(:user).where('last_name LIKE :last_name',
                            {:last_name => "%#{search_term}%"}
    )
  end

  def find_rants_by_username(search_term)
    Rant.joins(:user).where('username LIKE :username',
                            {:username => "%#{search_term}%"})
  end

  def find_rants_by_text(search_term)
    Rant.where('LOWER(rant) LIKE :rant',
                            {:rant => "%#{search_term}%"})
  end

  def find_rants_by_title(search_term)
    Rant.where('LOWER(title) LIKE :title',
               {:title => "%#{search_term}%"})
  end

end