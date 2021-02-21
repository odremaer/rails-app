class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :written_tests, class_name: 'Test', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "wrong format" }
  validates :email, uniqueness: true

  def passed_tests(level)
    Test
      .joins(:test_passages)
      .where(level: level, test_passages: { user_id: id })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
