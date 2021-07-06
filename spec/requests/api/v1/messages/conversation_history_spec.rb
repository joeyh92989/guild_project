require 'rails_helper'

describe 'conversation history' do
  describe 'conversation history' do
    describe 'Happy Path' do
      it 'send a successful response with up to 100 messages from for a specific user from a specific user ' do
        sender = User.create!(
          user_name: 'Joey'
        )
        receiver = User.create!(
          user_name: 'Val'
        )
        create_list(:message, 110, user_id: receiver.id, sender_id: sender.id)
        get "/api/v1/messages/#{receiver.id}", params: {
          "sender": sender.id,
          "last_30_days": false
        }
        messages = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(messages[:data].count).to eq(100)
        expect(messages[:data].first[:attributes]).to have_key(:user)
        expect(messages[:data].first[:attributes][:user][:id]).to eq(receiver.id)
        expect(messages[:data].first[:attributes]).to have_key(:sender)
        expect(messages[:data].first[:attributes][:sender][:id]).to eq(sender.id)
        expect(messages[:data].first[:attributes]).to have_key(:message)
        expect(messages[:data].first[:attributes]).to have_key(:created_at)
        expect(
          messages[:data].first[:attributes][:created_at] >= messages[:data].second[:attributes][:created_at]
        ).to eq(true)
      end
      it 'sends a succesful response with all messages from the last 30 days if requested' do
        sender = User.create!(
          user_name: 'Joey'
        )
        receiver = User.create!(
          user_name: 'Val'
        )
        create_list(:message, 20, user_id: receiver.id, sender_id: sender.id)
        create_list(:message, 20, user_id: receiver.id, sender_id: sender.id, created_at: Time.now - 50.days)
        get "/api/v1/messages/#{receiver.id}", params: {
          "sender": sender.id,
          "last_30_days": true
        }
        messages = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(messages[:data].count).to eq(20)
        expect(messages[:data].first[:attributes]).to have_key(:user)
        expect(messages[:data].first[:attributes][:user][:id]).to eq(receiver.id)
        expect(messages[:data].first[:attributes]).to have_key(:sender)
        expect(messages[:data].first[:attributes][:sender][:id]).to eq(sender.id)
        expect(messages[:data].first[:attributes]).to have_key(:message)
        expect(messages[:data].first[:attributes]).to have_key(:created_at)
        expect(
          messages[:data].first[:attributes][:created_at] >= messages[:data].second[:attributes][:created_at]
        ).to eq(true)
      end
    end
    describe 'Sad Path' do
      it 'sends an error when a messsage when no message form is provided ' do
        sender = User.create!(
          user_name: 'Joey'
        )
        receiver = User.create!(
          user_name: 'Val'
        )
        get "/api/v1/messages/#{receiver.id}", params: {
          "sender": sender.id
        }
        message = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(400)
        expect(message).to have_key(:errors)
      end
      it 'sends an error when a messsage when form requirement is not valid ' do
        sender = User.create!(
          user_name: 'Joey'
        )
        receiver = User.create!(
          user_name: 'Val'
        )
        get "/api/v1/messages/#{receiver.id}", params: {
          "sender": sender.id,
          "last_30_days": 'abc'
        }
        message = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(400)
        expect(message).to have_key(:errors)
      end
    end
  end
end
