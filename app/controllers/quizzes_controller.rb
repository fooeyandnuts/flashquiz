class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:edit, :update, :show, :takequiz, :destroy]
  before_action :set_card, only: [:show]
  respond_to :json, :html

  def index
    @quizzes = Quiz.all
    respond_with @quizzes
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      respond_to do |format|
        format.html { redirect_to quiz_path(@quiz) }
        format.json { render json: @quiz, status: :created }
      end
    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def takequiz
    
  end

  def edit
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to quizzes_path
    else
      render 'edit'
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path
  end

  protected

  def quiz_params
    params.require(:quiz).permit(:subject, :name, :user_id)
  end

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def set_card
    @card = Card.find(params[:card_id])
  end

end
