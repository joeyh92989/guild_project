class User <ApplicationRecord
  validates :user_name, presence: true, uniquness: true
  
  has_many :messages, dependent: :destroy
  has_many :senders, through: :messages
end