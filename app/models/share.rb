class Share < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :doc, dependent: :destroy
end
