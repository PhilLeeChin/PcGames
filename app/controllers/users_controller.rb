class UsersController < ApplicationController
   
   def show
      @user = User.find_by_id(params[:id])
      redirect_to '/' if !@user
      #binding.pry
  end
  
end
