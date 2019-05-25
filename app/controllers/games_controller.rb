class GamesController < ApplicationController

  def index
    games = Game.all

    if games.size > 0
      render json: games
    else
      render json: { error: "there are no games"}
    end
  end

  def show
    game = Game.find_by(id: params[:id])
    if game
      render json: game
    else
      render json: { error: "no such game"}
    end
  end

  def start
    game = Game.new
    game.populate_tiles
    game.save
    render json: game
  end

end
