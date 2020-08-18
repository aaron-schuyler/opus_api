class User < ApplicationRecord
  has_many :docs
  has_many :folders
  has_many :shares
  has_many :shared_docs, through: :shares, source: :doc

  has_secure_password
end
