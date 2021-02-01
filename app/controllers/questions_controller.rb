class QuestionsController < ApplicationController
  before_action :find_test
  skip_before_action :find_test, only: :new
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:body)
  end

  def show
    @question = @test.questions.find(params[:id])
  end

  def new
  end

  def create
    question = Question.create!(body: params.require(:question).permit(:body)[:body], test_id: params[:test_id])
    render plain: question.inspect
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to "/tests/#{@question.test_id}/questions"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: "Запрашиваемого вопроса не найдено"
  end

end
