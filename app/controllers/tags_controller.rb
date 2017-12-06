class TagsController < ApplicationController
  def index
    @questions = Question.all
    @question_tag_array = @questions.map {|q| q.tag1}.uniq
  end

  def show
    @questions = Question.all
    
  end
end
