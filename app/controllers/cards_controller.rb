class CardsController < ApplicationController
  before_action :set_quiz, only: [:new, :create, :edit, :update, :show, :destroy]
  before_action :set_card, only: [:edit, :update, :show, :destroy]

  def index
  end

  def new
    @card = Card.new
  end

  def create
    @card = @quiz.cards.new(card_params)
    if @card.save
      redirect_to quiz_path(params[:quiz_id])
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  protected

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:question, :answer, :quiz_id)
  end
end
