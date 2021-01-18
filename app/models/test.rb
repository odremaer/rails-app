class Test < ApplicationRecord
  def self.order_by_category(title)
    Test.joins("INNER JOIN 'categories' on categories.id = tests.category_id").\
    where("categories.title = :title", title: title).\
    order(id: :desc).\
    pluck(:title)
  end
end
