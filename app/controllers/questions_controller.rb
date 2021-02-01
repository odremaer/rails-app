class QuestionsController < ApplicationController
  before_action :find_test
  skip_before_action :find_test, only: [:new, :show]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:body)
  end

  def show
    @question = Question.find(params[:id])
    render plain: @question.body
  end

  def new
  end

  def create
    @question = Question.create!(body: question_params, test_id: params[:test_id])
    if @question.save
      render plain: @question.inspect
    else
      render plain: "Вопрос не удалось сохранить"
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    render plain: "Вопрос успешно удален"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: "Запрашиваемого вопроса не найдено"
  end

  def question_params
    params.require(:question).permit(:body)[:body]
  end

end
