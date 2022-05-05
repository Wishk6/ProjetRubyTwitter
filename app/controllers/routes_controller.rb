class RoutesController < ApplicationController
    def home
        @tweets = get_user_tweets(current_user.id, false)
    end

    def profile
        @pseudo = params[:pseudo]
        @tweets = get_user_tweets(User.where(pseudo: @pseudo)[0][:id], true)
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

        #add tweets
        @tweets << Tweet.where(user_id: user_id)
        for user in followers
            @tweets << Tweet.where(user_id: user[:followed_id])
            logger.info { user }
        end

        #add retweets
        retweets = Retweet.where(user_id: user_id)
        for retweet in retweets
            @tweets << Tweet.where(id: retweet[:tweet_id])
        end
        for user in followers
            retweets = Retweet.where(user_id: user[:followed_id])
            for retweet in retweets
                @tweets << Tweet.where(id: retweet[:tweet_id])
            end
        end

        return @tweets.reverse()
    end
end