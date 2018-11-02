class MemoryItem < ApplicationRecord
  belongs_to :memory_list, optional: true
  validates :content, presence: true
end
