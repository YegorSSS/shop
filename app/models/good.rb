class Good < ActiveRecord::Base
  belongs_to :category
  has_many :orders
  has_many :goodsinorders
  has_many :goodparams
  accepts_nested_attributes_for :goodparams, allow_destroy: true

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :articul, presence: true
  validates :articul, uniqueness: true
  validates :keyword, presence: true
  validates :description, presence: true
  validates :img, presence: true
  validates :category_id, presence: true
  validates :anons, presence: true
  validates :content, presence: true
  validates :price, presence: true
end
