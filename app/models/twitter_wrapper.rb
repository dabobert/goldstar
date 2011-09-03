class TwitterWrapper < ActiveRecord::Base
  
  def self.fetch_via_hashtag
    network = Network.find_by_name("twitter")
    Twitter::Search.new.hashtag("goldstar").language("en").no_retweets.fetch.each do |tweet|
      begin
        star = Star.create! :description=>tweet.text,# :recipient=>nil,
                :sender=>Profile.construct(tweet.from_user, "twitter"),
                :source_id=>tweet.id_str.to_i.to_s(36), :source_type=>"twitter", :sender_network=>network,
                :receiver_network=>network
        Debug.echo_log "goldstar created"
      rescue
        Debug.echo_log "goldstar already exists with this info"
      end
    end
  end
end