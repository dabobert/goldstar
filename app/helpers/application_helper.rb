module ApplicationHelper

  def hollow_star
    raw '<span style="color:gold">&#9734;</span>'
  end
  
  def gold_star
    filled_star
  end
  
  def filled_star
    raw '<span style="color:gold">&#9733;</span>'
  end
end
