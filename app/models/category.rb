class Category < ActiveRecord::Base
  has_many :goods

  validates :title, presence: true
  validates :keyword, presence: true
  validates :description, presence: true
  validates :parent_id, presence: true
end
