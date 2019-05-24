class PlayersController < ApplicationController
  
  def index
    players = Player.all

    if players.size > 0
      render json: players
    else
      render json: { error: "there are no players"}
    end
  end

  def sign_in
    render json: "hello"
  end

end
