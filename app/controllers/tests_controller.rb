class TestsController < ApplicationController
  before_action :authenticate_user!
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def show
    @test = Test.find(params[:id])
  end

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    @user = User.find(session[:user_id])
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def rescue_with_test_not_found
    render plain: 'Запрашиваемого теста не найдено'
  end

end
