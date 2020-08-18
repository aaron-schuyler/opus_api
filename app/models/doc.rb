class Doc < ApplicationRecord
  has_many :shares
  belongs_to :user, dependent: :destroy
  belongs_to :folder, dependent: :destroy
end
