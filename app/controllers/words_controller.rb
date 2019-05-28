class WordsController < ApplicationController

  def index
    words = Word.all

    if words.size > 0
      render json: words
    else
      render json: { error: "there are no words"}
    end
  end

  def show
    @word = Word.find(params[:id])
  end

  def create
    Word.find_or_create_by(word: params[:word].downcase)
  end

  def destroy
    word = Word.find_by(id: params[:id])

    if word
      word.destroy
      render json: { success: "#{word.word} is no more" }
    else
      render json: { error: "word not found" }
    end
  end

  def random
    word = Word.find_by(word: Word.random)
    render json: word
  end

end
