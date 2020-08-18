class Folder < ApplicationRecord
  belongs_to :user
  has_many :docs, dependant: :destroy

  validates :name, presence: true
end
