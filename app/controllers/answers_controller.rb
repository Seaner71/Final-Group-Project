class AnswersController < ApplicationController
  def show
    @question = Question.find_by_id(params[:id])
  end

  def new
  end

  def create
    @question = Question.find_by_id(params[:question_id])
    @answer= @question.answers.new(answer_params)
    @answer.votes = 0
    @answer.user_id = current_user.id

    if @answer.save
      redirect_to question_path(@question)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def upvote
    @question = Question.find_by_id(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.upvote_by current_user
    redirect_to @question

  end

  def downvote
    @question = Question.find_by_id(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.downvote_by current_user
    redirect_to @question
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
