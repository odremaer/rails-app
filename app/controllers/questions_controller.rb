class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:body)
  end

  def show; end

  def new
    @test = Test.find(params[:test_id])
    @question = Question.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to tests_path
  end

  def edit
    @question = Question.find(params[:id])
    @test = Test.find(@question.test_id)
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to tests_path
    else
      render :edit
    end
  end
  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Запрашиваемого вопроса не найдено'
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
