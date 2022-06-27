class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  has_many :order_items

  default_scope { where(active: true) }

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      all
    end
  end
end
