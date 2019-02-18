class Task < ApplicationRecord
  has_paper_trail only: [:title, :done]
  
  validates :title, presence: true
end
