class GistsController < ApplicationController
  def create
    set_test_passage
    service = GistQuestionService.new(@test_passage.current_question)

    service.call
    gist_url = service.html_url

    if service.successful?
      flash[:notice] = I18n.t('gists.success', url: gist_url, url_id: service.id)
      Gist.create!(gist_url: gist_url, user_email: current_user.email, question: @test_passage.current_question)
    else
      flash[:alert] = I18n.t('gists.failure')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
