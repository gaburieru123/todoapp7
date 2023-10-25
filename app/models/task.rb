class Task < ApplicationRecord
  validates :title, :detail, presence: true


end
