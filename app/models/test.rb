class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  belongs_to :user
  has_many :results
  has_many :users, through: :results
  def self.certain_category(title)
    Test
    .joins("JOIN categories on categories.id = tests.category_id")
    .where(categories: { title: title })
    .order(id: :desc)
    .pluck(:title)
  end
end
