class Link < ActiveRecord::Base
  belongs_to :informer

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :content, presence: true
  validates :link_position, presence: true

end
