class QuestionsController < ApplicationController
  # has_scope :by_tag1
  def index
    # @questions = Question.all
    @questions = apply_scopes(Question).all
  end

  def show
    @question = Question.find_by_id(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find_by_id(params[:id])
  end

  def update
    @question = Question.find_by_id(params[:id])
    @question.update(question_params)
    redirect_to questions_path
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
