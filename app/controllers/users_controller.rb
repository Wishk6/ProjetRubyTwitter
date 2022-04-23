class UsersController < ApplicationController
    before_action :authenticate_user!
    def logout
   
    end
end