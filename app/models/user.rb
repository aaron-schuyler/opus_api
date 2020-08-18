class User < ApplicationRecord
  has_many :docs
  has_many :folders
  has_many :shares
  has_many :shared_docs, through: :shares, source: :doc

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
end
