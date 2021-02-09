class Test < ApplicationRecord
  scope :easy_levels, -> {where(level: 0..1)}
  scope :medium_levels, -> {where(level: 2..4)}
  scope :hard_levels, -> {where(level: 5..Float::INFINITY)}

  belongs_to :category
  belongs_to :user

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }
  validates :title, presence: true

  def self.certain_category(title)
    Test
    .joins(:category)
    .where(categories: { title: title })
    .order(id: :desc)
    .pluck(:title)
  end
end
