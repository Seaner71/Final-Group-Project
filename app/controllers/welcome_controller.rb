class WelcomeController < ApplicationController
  def index
    @blogs = Blog.all
    @tag = Tag.new
    @questions = Question.all
    @sort_by_answers = @questions.joins(:answers).group("questions.id").count.sort_by {|k, v| v}.reverse
    @sort_by_best = @questions.joins(:answers).group("questions.id").sum('answers.cached_votes_up').sort_by {|k,v| v}.reverse
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
