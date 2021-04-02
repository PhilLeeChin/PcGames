class GamesController < ApplicationController
    # before_action :redirect_if_not_logged_in

    def index
        if params[:user_id] && @user = user.find_by_id(params[:user_id])
            @games = @user.games
        else
            @error = "That post doesn't exist" if params[:user_id]
            @games = Game.all
        end
    end

    def show
        @game = Game.find_by_id(params[:id])
    end

    def new
        @game = Game.new
    end

    def create
        @game = Game.new(game_params)
        # binding.irb
        @game.user = current_user

        if @game.save!
            redirect_to game_path(@game)
        else
            render :new
        end
    end

    def edit
        @game = Game.find_by(id: params[:id])
    end

    def update
        @game = Game.find_by(id: params[:id])
        # binding.irb
        if @game.user = current_user
            @game.update(game_params)
            redirect_to game_path(@game)
        else
            render :edit
        end
    end

    def destroy
        @game = Game.find(params[:id]).destroy
        redirect_to games_path
    end

    private

    def game_params
        # binding.irb
        params.require(:game).permit(:title, :developer, :genre, :user_id)
    end
end
