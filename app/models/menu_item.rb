class MenuItem < ApplicationRecord
  belongs_to :menu_item, optional: true
  has_many :menu_items

  scope :published, -> { where(published: true).order(position: :asc) }
end
