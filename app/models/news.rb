class News < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :anons, presence: true
  validates :content, presence: true
end
