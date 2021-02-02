class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:body)
  end

  def show
  end

  def new
  end

  def create
    puts question_params
    @question = Question.new(body: question_params[:body], test_id: @test.id)
    if @question.save
      redirect_to test_questions_path
    else
      render plain: "Вопрос не удалось сохранить"
    end
  end

  def destroy
    @question.destroy
    render plain: "Вопрос успешно удален"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Запрашиваемого вопроса не найдено"
  end

  def question_params
    params.require(:question).permit(:body)
  end

end
