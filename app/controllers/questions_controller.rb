class QuestionsController < ApplicationController
  has_scope :by_tag1
  def index
    @questions = Question.all
    @user = current_user
    @questions = apply_scopes(Question).all

  end

  def show
    get_question
    @user = current_user
  end

  def new
    @question = Question.new
  end

  def edit
    get_question
  end

  def update
    get_question
    @question.update(question_params)
    redirect_to questions_path
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
      if @question.save
        redirect_to question_path(@question)
      else
        render 'new'
      end
  end

  def destroy
  end

  private

  def get_question
    @question = Question.find_by_id(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body, :tag1, :tag_list, :user_id)
  end

  def user_params
    params.permit(:id, :username, :location, :bio, :previous_industry, :github_url, :avatar)
  end

end
