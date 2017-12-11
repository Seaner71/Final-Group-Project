class AnswersController < ApplicationController
  def show
    @question = Question.find_by_id(params[:id])
    @answers = @question.answers.all
  end

  def new
    @answer = Answer.new
  end

  def create
    get_question
    @answer = @question.answers.new(answer_params)
<<<<<<< HEAD
    # @answer.votes = 0
=======
>>>>>>> ac4bfc1361ab34a3047c32851440ab774a96db49
    @answer.user_id = current_user.id
    # @question.answer_number = @question.answer_number + 1
    if @answer.save
      redirect_to question_path(@question)
    end
  end

  def edit
    get_question
    get_answer
  end

  def update
    get_question
    get_answer
    if @answer.update(answer_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    get_question
    get_answer
    @answer.destroy
    @question.answer_number -= 1
      redirect_to question_path(@question)
  end

  def upvote
    get_answer
    @answer.upvote_by current_user
    @q = Question.find(params[:question_id])
    redirect_to @q

  end

  def downvote
    get_answer
    @answer.downvote_by current_user
    @q = Question.find(params[:question_id])
    redirect_to @q
  end

  private

  def get_question
    @question = Question.find_by_id(params[:question_id])
  end

  def get_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:content)
  end

  def upvotes
    @upovtes = Answer.votes_for.size
  end

end
