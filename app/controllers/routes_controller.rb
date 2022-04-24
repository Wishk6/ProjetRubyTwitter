class RoutesController < ApplicationController
    def home
        @tweets = Tweet.all
    end
    def profile
        @tweets = Tweet.all
    end
end