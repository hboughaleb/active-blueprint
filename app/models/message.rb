class Message < ApplicationRecord
  validates :content, presence: true
  validates :destination, presence: true
  validates :sender, presence: true
end
