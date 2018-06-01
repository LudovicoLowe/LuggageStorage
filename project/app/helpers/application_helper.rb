module ApplicationHelper
  def correct_user?(place)
    return place.user == current_user
  end


end
