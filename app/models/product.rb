class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      all
    end
  end
end
