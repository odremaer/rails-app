class User < ApplicationRecord

  attr_reader :password
  attr_writer :password_confirmation

  has_many :written_tests, class_name: 'Test', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true, if: -> { password_digest.blank? }
  validates :password, confirmation: true

  def passed_tests(level)
    Test
      .joins(:test_passages)
      .where(level: level, test_passages: { user_id: id })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
