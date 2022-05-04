class RoutesController < ApplicationController
    def home
        @tweets = get_user_tweets(current_user.id, false)
    end

    def profile
        @username = params[:username]
        @tweets = get_user_tweets(User.where(userName: @username)[0][:id], true)
        logger.info { @tweets.count }
    end

    def notification 
    end

    private

    def get_user_tweets(user_id, my_tweets)
        followers = Array.new
        @tweets = Array.new

        if my_tweets
            followers = Follow.where(followed_id: user_id)
            logger.info { 'my_tweets = true' }
            logger.info { followers.count }
        else
            followers = Follow.where(follower_id: user_id)
            logger.info { 'my_tweets = false' }
            logger.info { followers.count }
        end

        #add follows tweets
        for user in followers
            tweets = Tweet.where(user_id: user[:id])
            if tweets.count > 0
                @tweets.push tweets
            end
        end

        #add follows retweets
        for user in followers
            retweets = Retweet.where(user_id: user[:id])
            if retweets.count > 0
                for retweet in retweets
                    @tweets.push Tweet.where(id: retweet[:tweet_id])
                end
            end
        end

        return @tweets.reverse
    end
end