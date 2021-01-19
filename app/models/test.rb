class Test < ApplicationRecord
  def self.certain_category(title)
    Test
    .joins("JOIN categories on categories.id = tests.category_id")
    .where(categories: { title: title })
    .order(id: :desc)
    .pluck(:title)
  end
end
