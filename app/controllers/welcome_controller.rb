class WelcomeController < ApplicationController
  def index
    @blogs = Blog.all
    @tag = Tag.new
    @questions = Question.all
    @sort =  Answer.find_by_sql("
      SELECT * FROM questions
      INNER JOIN answers ON questions.id = answers.question_id
      ORDER BY cached_votes_up desc")
    @blog = Blog.find_by_id(params[:id])
    @user = User.find_by_id(params[:id])
    @question = Question.find_by_id(params[:id])

  end

  def show

  end

  def new

  end

  def create

  end

  def edit
    @question = Question.find_by_id(params[:id])
  end

  def update
  end

  def destroy
  end


  private
  def blog_params
    params.require(:blog).permit(:title, :body, :user_id)
  end
  def question_answer_size(activerecord)
      answer_obj = {}
      activerecord.each do |question|
        answer_obj[question.id] = question.answers.size
      end
      answer_obj
    end

end
