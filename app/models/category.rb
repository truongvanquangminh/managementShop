class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    def self.search(term)
        if term
          where('name LIKE ?', "%#{term}%")
        else
          all
        end
      end
end
