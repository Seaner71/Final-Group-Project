class AnswersController < ApplicationController
  def show
  end

  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find_by_id(params[:question_id])
    @answer= @question.answers.create(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to @question
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
