class TwitterUser < ActiveRecord::Base

  has_many :tweets

  def fetch_tweets!
    sleep(5)
    user_tweets = Twitter.search("from:#{self.username}", :count => 50).results.map(&:text)  
    user_tweets.each do |tweet|
      self.tweets.create(text: tweet)
    end
    self.tweets
  end

  def tweets_stale?
    self.tweets.last.created_at < (Time.now - (15 * 60))
  end

end
    # User#fetch_tweets! should make an API call
    # and populate the tweets table

    # this will be the API call that is currently in the controller....
    # populate the tweets table (database)
    # return something from the tweets table. 
