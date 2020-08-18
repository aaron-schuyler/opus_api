class Folder < ApplicationRecord
  belongs_to :user
  has_many :docs, dependent: :destroy

  validates :name, presence: true
end
