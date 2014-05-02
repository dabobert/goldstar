module ApplicationHelper

  def render_fav star
    raw link_to(heart, star_path(star), :class=>"fav", :method=>:post)
  end
  
  def render_new_fav star
    raw(link_to(heart, star_favorites_path(star), :class=>"new_fav", :method=>:post))
  end

  def heart
    #the heart character is displayed wierd in text mate, which is why i use the entity. ♥
    #i don't trust raw special chars in all enviorments, editors, ides's and os's
    @heart ||= "&#9829;"
  end
  
  def grey_heart
    @grey_heart ||= raw('<span style="color:grey">&#9829;</span>')
  end
  
  def red_heart
    @red_heart ||= raw('<span style="color:red">&#9829;</span>')
  end
  
  def hollow_star
    @hollow_star ||= raw('<span style="color:gold">&#9734;</span>')
  end
  
  def gold_star
    @gold_star ||= raw(filled_star)
  end
  
  def filled_star
    @filled_star ||= raw('<span style="color:gold">&#9733;</span>')
  end


end