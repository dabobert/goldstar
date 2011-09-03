class TwitterWrapper < ActiveRecord::Base
  
  def self.fetch_via_hashtag
    network = Network.find_by_name("twitter")
    Twitter::Search.new.hashtag("goldstar").language("en").no_retweets.fetch.each do |tweet|
      #source_id = tweet.id_str.to_s(36)
      star = Star.create! :description=>tweet.text,# :recipient=>nil,
              :poster=>Profile.construct(tweet.from_user, "twitter"),
              :source_id=>tweet.id_str, :source_type=>"twitter", :sender_network=>network,
              :receiver_network=>network
    end
  end
end