require 'octokit'

class GistQuestionService

  include ActionView::Helpers::TranslationHelper

  ACCESS_TOKEN = Rails.application.credentials.github_access_token

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: t('services.gist_question_service.question_description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:answer)
    content.join("\n")
  end
end
