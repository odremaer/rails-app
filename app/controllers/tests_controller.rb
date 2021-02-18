class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show edit start destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def show; end

  def index
    @tests = Test.all
  end

  def start
    @user = current_user
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.written_tests.build(test_params)
    if @test.save
      redirect_to @test, notice: "Test created succesfully"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: "Test deleted succesfully"
  end

  private

  def rescue_with_test_not_found
    render plain: 'Запрашиваемого теста не найдено'
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
