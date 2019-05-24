class WordsController < ApplicationController

  def index
    words = Word.all

    if words.size > 0
      render json: words
    else
      render json: { error: "there are no words"}
    end
  end

  def create
    word = Word.new(word: params[:word])
    
  end

end
