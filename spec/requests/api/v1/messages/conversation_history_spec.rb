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
          "sender": sender.id
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
      end
    end
    describe 'Sad Path' do
      xit 'sends an error when a messsage of no length is sent' do
        sender = User.create!(
          user_name: 'Joey'
        )
        receiver = User.create!(
          user_name: 'Val'
        )
        post '/api/v1/messages', params: {
          "user_id": receiver.id,
          "sender": sender.id,
          "message": ''
        }
        message = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(400)
        expect(message).to have_key(:errors)

      end
    end
  end
end
