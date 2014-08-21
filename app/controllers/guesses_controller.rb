class GuessesController < ApplicationController
  def new
  	@guess = Guess.new
  end

  def create
  	@guess = Guess.new(params.require(:guess).permit(:guess))
  end
end
