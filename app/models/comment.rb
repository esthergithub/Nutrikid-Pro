class Comment < ApplicationRecord
  belongs_to :patient
  validates :content, presence: true
end
