class Doc < ApplicationRecord
  has_many :shares, dependant: :destroy
  has_many :shared_users, through: :shares, source: :user
  belongs_to :user
  belongs_to :folder

  validates :name, presence: true
end
