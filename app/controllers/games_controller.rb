class GamesController < ApplicationController

  def index
    games = Game.all

    if games.size > 0
      render json: games
    else
      render json: { error: "there are no games"}
    end
  end

  def create

  end

  def update
    
  end

  def start
    game = Game.create
    game.key = Game.generate_key
    words = Word.random(25, 4, 10)
    words.each do |w|
      game.words << Word.find_by(word: w)
    end

    game.save
    
    render json: game
  end

end
