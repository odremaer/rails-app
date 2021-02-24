class Gist < ApplicationRecord
  belongs_to :question

  def question_body
    self.question.body
  end

  def url_id
    gist_url.split('/')[-1]
  end
end
