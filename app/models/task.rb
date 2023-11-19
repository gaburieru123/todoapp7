class Task < ApplicationRecord
  validates :title, :detail, presence: true

  belongs_to :user
end
