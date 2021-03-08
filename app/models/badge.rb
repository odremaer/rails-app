class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy

  include Validations

  IMAGES = Dir.children(Rails.root.join('app', 'assets', 'images', 'badges').to_s)
  RULE_TYPES = ['category', 'level', 'first attempt'].freeze
end
