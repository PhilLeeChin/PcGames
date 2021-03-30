class UsersController < ApplicationController
   before_action :redirect_if_not_logged_in
   
   def show
      @user = User.find_by_id(params[:id])
      redirect_to '/' if !@user
      #binding.pry
  end
  
end
