class Test < ApplicationRecord
  scope :certain_category, -> (title){
                                joins(:category)
                               .where(categories: { title: title })
                               .order(id: :desc).pluck(:title)
                           }

  belongs_to :category
  belongs_to :user

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }
  validates :title, presence: true
  def self.selection_by_level(level)
    case level
    when 'easy'
      where(level: 0..1)
    when 'medium'
      where(level: 2..4)
    when 'hard'
      where(level: 5..Float::INFINITY)
    end
  end
end
