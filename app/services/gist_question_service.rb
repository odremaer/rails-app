class GistQuestionService
  ACCESS_TOKEN = Rails.application.credentials.github_access_token

  attr_accessor :html_url, :id

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
    resource = @client.create_gist(gist_params)
    @html_url = resource.html_url
    @id = resource.id
    resource
  end

  def successful?
    @html_url.present?
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.question_description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:answer)].join("\n")
  end
end
