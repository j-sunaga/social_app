class Timeline < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { in: 1..200 }
end
