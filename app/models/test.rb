class Test < ApplicationRecord
  def self.order_by_category(title)
    category_id = Category.where("title = :title", title: title)[0].id
    Test.where("category_id = :category_id", category_id: category_id).order(id: :desc)
  end
end
