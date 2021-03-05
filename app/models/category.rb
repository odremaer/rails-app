class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  has_many :tests, dependent: :destroy
  
  validates :title, presence: true

  def self.all_categories_title
    Category.all.pluck(:title)
  end
end
