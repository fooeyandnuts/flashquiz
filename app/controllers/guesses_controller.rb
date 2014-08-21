class GuessesController < ApplicationController
  def new
  	@guess = Guess.new
  end

  def create
  	@guess = Guess.new(params.require(:guess).permit(:guess))
  	if @guess.save == Card.Answer
  	  redirect_to quiz_path(params[:quiz_id])
    else
      render 'new'
    end
  end
end
