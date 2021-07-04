require "rails_helper"

RSpec.describe User do
  describe "validations" do
    it { should validate_presence_of :user_name }
    it { should validate_uniqueness_of :user_name }
  end
  describe "relationships" do
    it { should have_many :messages }
    it { should have_many(:senders).through(:messages) }
  end
end