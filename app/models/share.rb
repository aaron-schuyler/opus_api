class Share < ApplicationRecord
  belongs_to :user
  belongs_to :doc

  validates :user_id, presence: true, uniqueness: { scope: :doc_id }
  validates :doc_id, presence: true, uniqueness: { scope: :user_id }
end
