class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions, :dependent => :destroy
  has_many :results, :dependent => :destroy
  has_many :users, through: :results, :dependent => :destroy
  def self.certain_category(title)
    Test
    .joins(:category)
    .where(categories: { title: title })
    .order(id: :desc)
    .pluck(:title)
  end
end
