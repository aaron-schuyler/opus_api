class Folder < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :docs
end
