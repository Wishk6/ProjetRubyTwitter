class RoutesController < ApplicationController
    def home
        @tweets = Tweet.all
    end
end