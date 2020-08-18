class Doc < ApplicationRecord
  has_many :shares
  has_many :shared_users, through: :shares, source: :user
  belongs_to :user, dependent: :destroy
  belongs_to :folder, dependent: :destroy

  validates :name, presence: true
end
