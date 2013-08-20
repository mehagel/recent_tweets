get '/' do
  erb :index
end

# get '/user_name' do
#   puts "*"*80
#   puts "hi"
#   p params
#   @twitter_user = TwitterUser.create(username: params[:username])
#   @user_tweets = Twitter.search("from:#{params[:username]}", :count => 10).results.map(&:text)
#     @user_tweets.each do |tweet|
#       @twitter_user.tweets.create(text: tweet)
#     end


#   erb :user_tweets
# end

post '/username' do
  @twitter_user = TwitterUser.find_by_username(params[:username])
  
  if @twitter_user
    if @twitter_user.tweets.empty? || @twitter_user.tweets_stale?
      @twitter_user.fetch_tweets!
    else 
      @user_tweets = @twitter_user.tweets.map(&:text)
    end    

  else
    @twitter_user = TwitterUser.create(username: params[:username])
    @user_tweets = @twitter_user.fetch_tweets!.map(&:text)
  end

  @tweets = @twitter_user.tweets

  erb :_tweet_list, layout: false
end

