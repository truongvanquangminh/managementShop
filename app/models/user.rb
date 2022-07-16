class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable, :rememberable
  devise :database_authenticatable, :registerable,
         :validatable, :trackable
  belongs_to :role, optional: true
  validates :name, presence: true
  before_save :assign_role
  has_many :comments

  # has_many :users, dependent: :restrict_with_exception

  def assign_role
    self.role = Role.find_by name: 'User' if role.nil?
  end

  def admin?
    role.name == 'Admin'
  end

  def user?
    role.name == 'User'
  end

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      all
    end
  end
end
