class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :product, dependent: :destroy

    def self.search(term)
        if term
          where('name LIKE ?', "%#{term}%")
        else
          all
        end
      end
end
