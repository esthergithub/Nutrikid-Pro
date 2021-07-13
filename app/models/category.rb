class Category < ApplicationRecord
    has_many :patients, dependent: :destroy
    validates :name, presence: true
end
