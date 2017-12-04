class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find_by_id(params[:id])
  end

  def edit
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
      if @question.save
        redirect_to root_path
      else
        render 'new'
      end
  end

  def destroy
  end



  private
  def question_params
    params.require(:question).permit(:title, :body, :tag1)
  end

end
