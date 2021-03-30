class SessionsController < ApplicationController
    def login
        @user = User.new
    end

    def register
        @user = User.new
    end   

    def create
        @user = User.find_by(username: sessison_params[:username])
        if @user && @user.authenticate(sessison_params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def new
        @user = User.find_by(username: sessison_params[:username])
        if @user && @user.authenticate(sessison_params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Login invalid, check credentials and try again"
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    def omni
        # binding.irb
        @user = User.find_with_omniauth(auth)
        if @user
            session[:user_id] = @user.id
            redirect_to games_path
        else
             redirect_to login_path
        end
    end

    private

    def session_params
        params.require(:user).permit(:username, :email, :password)
    end

    def auth
        request.env['omniauth.auth']
    end
     
end