class RoutesController < ApplicationController
    def home
        @tweets = Tweet.all.reverse
    end
    def profile
        @tweets = Tweet.all.reverse
    end
end