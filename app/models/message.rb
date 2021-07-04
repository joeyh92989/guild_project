class Message < ApplicationRecord
  validates :user_id, presence: true
  validates :sender_id, presence: true

  belongs_to :user
  belongs_to :sender, class_name: 'User'
end
