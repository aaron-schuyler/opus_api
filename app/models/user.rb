class User < ApplicationRecord
  has_many :docs, dependent: :destroy
  has_many :folders, dependent: :destroy
  has_many :shares, dependent: :destroy
  has_many :shared_docs, through: :shares, source: :doc

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
end
