class RoutesController < ApplicationController
    def home
        @tweets = Tweet.all.reverse
    end
    def profile
        @tweets = Tweet.all.reverse
        @username = params[:username]
    end
end