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
    render json: @word
  end

  def create
    Word.find_or_create_by(word: params[:word].downcase)
  end

  def update
    word = Word.find_by(id: params[:id])
    word.update(word: params[:word])

    if word.save
      render json: word
    else
      render json: {error: "can't be updated, sorry! no more useful messages here."}
    end 

    words = Word.all.filter do |w|
      w.word == params[:word]
    end 

    if words.size > 1
      word.destroy
    end 

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
