class Message < ApplicationRecord
  validates :user_id, presence: true
  validates :sender_id, presence: true
  validates :message, presence: true, length: { in: 1..150 }, on: :create

  belongs_to :user
  belongs_to :sender, class_name: 'User'
end
