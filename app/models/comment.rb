class Comment < ApplicationRecord
  belongs_to :patient
  validates :content, presence: true
  has_rich_text :content

  belongs_to :user
end
