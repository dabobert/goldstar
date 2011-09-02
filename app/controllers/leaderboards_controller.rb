class LeaderboardsController < ApplicationController
  
  def show
    @top_senders    = Star.select("sender_id, count(*) as count").group(:sender_id).order("count desc").limit(25)
    @top_receivers   = Star.select("receiver_id, count(*) as count").group(:receiver_id).order("count desc").limit(25)
  end
end
