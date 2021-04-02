class CommentsController < ApplicationController
    
    def index
        if params[:game_id] && @game = Game.find_by_id(params[:game_id])
            @comments = @game.comments
        else
            flash[:message] = "Game can not be found"
            @comments = Comment.all
        end
    end

    def new
        if params[:game_id] && @game = Game.find_by_id(params[:game_id])
            @comment = @game.comments.build
        else
            flash[:message] = "Game can not be found"
            @comment = Comment.new
        end
        
    end

    def show
        @comment = Comment.find(id: params[:id])
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to '/'
        else
            render :new
        end
    end

    def edit
        @comment = Comment.find(id: params[:id])
    end

    def update
        @comment = Comment.find(id: params[:id])
        if @comment.update(comment_params)
            redirect_to '/'
        else
            render :edit
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :game_id)
    end
end
