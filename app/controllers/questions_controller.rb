class QuestionsController < ApplicationController


  def index
    # @questions = Question.where(nil) # creates an anonymous scope
    # @questions = @questions.title(params[:title]) if params[:title].present?
    # @questions = @questions.contains(params[:body]) if params[:body].present?
    @q = Question.ransack(params[:q])
    @questions = @q.result.includes(:user, :tags, :answers)
  end

  def search
    index
    render :index
  end

  def show
    get_question
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
    redirect_to question_path(@question)
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
    get_question
    @question.destroy
      redirect_to questions_path
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
