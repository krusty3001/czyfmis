class UsersController < ApplicationController
  def index
    @users = User.all(:order => "email")
  end

end
