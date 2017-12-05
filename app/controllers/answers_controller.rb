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
      redirect_to questions_path
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
