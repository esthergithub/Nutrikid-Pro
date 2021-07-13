class Category < ApplicationRecord
    has_many :patients, dependent: :destroy
end
