class SessionsController < ApplicationController
    def login
        @user = User.new
    end   

    def create
        @user = User.create(session_params)
        # binding.irb
        if @user.save
            # binding.irb
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to register_path
        end
    end

    def new
        @user = User.find_by(email: session_params[:email])
        if @user && @user.authenticate(session_params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Login invalid, please try again"
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    def omni
        @user = User.find_with_omniauth(auth)
        #  binding.irb
        if @user
            session[:user_id] = @user.id
            #binding.irb
            redirect_to user_path(@user)
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