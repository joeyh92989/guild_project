require 'rails_helper'

RSpec.describe Message do
  describe 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :message }
    it {
      should validate_length_of(:message)
        .is_at_least(1)
        .is_at_most(150)
    }
    it { should validate_presence_of :sender_id }
  end
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :sender }
  end
end
