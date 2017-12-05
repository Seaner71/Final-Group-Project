class AnswersController < ApplicationController
  def show
    @question = Question.find_by_id(params[:id])
  end

  def new
    @answer = Answer.new
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
    @answer = Answer.find_by_id(params[:id])
  end

  def update
    @answer = Answer.find_by_id(params[:id])
    @answer.update(answer_params)
    redirect_to question_answer_path
  end

  def destroy
  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.upvote_by current_user
    @q = Question.find(params[:question_id])
    redirect_to @q

  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.downvote_by current_user
    @q = Question.find(params[:question_id])
    redirect_to @q
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
