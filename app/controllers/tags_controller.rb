class TagsController < ApplicationController
  def index
    @questions = Question.all
    @question_tag_array = @questions.map {|x| x.tag1}.uniq
  end
end
