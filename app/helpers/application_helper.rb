module ApplicationHelper

  def render_fav star
    link_to "&#9829;", star_path(star), :class=>"fav", :method=>:post
  end
  
  def render_new_fav star
    link_to "&#9829;", star_favorite_path(star), :class=>"new_fav", :method=>:post
  end

  def hollow_star
    raw @hollow_star
  end
  
  def gold_star
    raw @gold_star
  end
  
  def filled_star
    raw @filled_star
  end
  
  def grey_heart
    raw @grey_heart
  end
  
  def red_heart
    raw @red_heart
  end
end
