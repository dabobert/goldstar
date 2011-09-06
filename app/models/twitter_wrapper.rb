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
  
  
  def self.tiny_url(available_length, url)
    return url if url.length < available_length
    string = "http://is.gd/api.php?longurl=" + CGI::escape(url)
    open(string).read.strip
  rescue StandardError => e
    puts "Error in tiny_url: #{e.message}\n#{e.backtrace}"
  end
  
  
  def self.user_config
    twitter_config = YAML.load(File.read(Rails.root.join('config', 'twitter.yml')))[Rails.env]

    oauth_consumer = OAuth::Consumer.new(twitter_config['consumer_key'], twitter_config['consumer_secret'],
                                         :site => 'http://api.twitter.com',
                                         :request_endpoint => 'http://api.twitter.com',
                                         :sign_in => true)

    request_token = oauth_consumer.get_request_token
    rtoken  = request_token.token
    rsecret = request_token.secret
    {:request_token=>request_token,:oauth_consumer=>oauth_consumer}
    #request_token.authorize_url
  end



  
  def self.site_config
    require 'rubygems'
    require 'twitter'
    require 'oauth'

    twitter_config = YAML.load(File.read(Rails.root.join('config', 'twitter.yml')))[Rails.env]

    oauth_consumer = OAuth::Consumer.new(twitter_config['consumer_key'], twitter_config['consumer_secret'],
                                         :site => 'http://api.twitter.com',
                                         :request_endpoint => 'http://api.twitter.com',
                                         :sign_in => true)

    request_token = oauth_consumer.get_request_token
    rtoken  = request_token.token
    rsecret = request_token.secret

    puts "Now visit the following URL:"
    puts request_token.authorize_url

    print "What was the PIN twitter provided you with? "
    pin = gets.chomp

    begin
      OAuth::RequestToken.new(oauth_consumer, rtoken, rsecret)
      access_token = request_token.get_access_token(:oauth_verifier => pin)

      puts "oauth_token: " + access_token.token
      puts "oauth_token_secret: " + access_token.secret

      Twitter.configure do |config|
        config.consumer_key = twitter_config['consumer_key']
        config.consumer_secret = twitter_config['consumer_secret']
        config.oauth_token = access_token.token
        config.oauth_token_secret = access_token.secret
      end

      Twitter::Client.new.verify_credentials
    rescue Twitter::Unauthorized
      puts "> FAIL!"
    end  
  end
  
end