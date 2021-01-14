class Test < ApplicationRecord
  belongs_to :category
  def self.order_by_category(title)
    result = []
    Test.joins(:category).where("categories.title = :title", title: title).order(id: :desc).select(:title).each { |cur_test| result << cur_test.title }
    result
  end
end
