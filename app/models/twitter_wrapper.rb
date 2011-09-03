class TwitterWrapper < ActiveRecord::Base
  
  def self.fetch_via_hashtag
    source_type = "twitter"
    Twitter::Search.new.hashtag("goldstar").language("en").no_retweets.fetch.each do |tweet|
      #source_id = tweet.id_str.to_s(36)
        star = Star.create! :description=>tweet.text, :poster=>tweet.from_user, :recipient=>nil,
                :source_id=>tweet.id_str, :source_type=>"twitter"
    end
  end
end
