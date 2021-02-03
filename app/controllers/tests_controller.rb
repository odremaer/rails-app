class TestsController < ApplicationController
  before_action :find_test, only: %i[show]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def show; end

  def index
    @tests = Test.all
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Запрашиваемого теста не найдено'
  end

end
