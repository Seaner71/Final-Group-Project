class TagsController < ApplicationController
  def index
    @questions = Question.where(params[:tags1])
    # qtag = @questions.title
  end
end
