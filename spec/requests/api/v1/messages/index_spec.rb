require 'rails_helper'

describe 'Message index' do
  describe 'Message index' do
    describe 'Happy Path' do
      it 'send a successful response with up to 100 messages from and to any user  ' do
        sender1 = User.create!(
          user_name: 'Joey'
        )
        sender2 = User.create!(
          user_name: 'Charlie'
        )
        receiver = User.create!(
          user_name: 'Val'
        )
        create_list(:message, 55, user_id: receiver.id, sender_id: sender1.id)
        create_list(:message, 55, user_id: receiver.id, sender_id: sender2.id)
        get "/api/v1/messages", params: {
          "last_30_days": false
        }
        messages = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(messages[:data].count).to eq(100)
        expect(messages[:data].first[:attributes]).to have_key(:user)
        expect(messages[:data].first[:attributes][:user][:id]).to eq(receiver.id)
        expect(messages[:data].first[:attributes]).to have_key(:sender)
        expect(messages[:data].first[:attributes][:sender][:id]).to eq(sender1.id)
        expect(messages[:data].last[:attributes]).to have_key(:sender)
        expect(messages[:data].last[:attributes][:sender][:id]).to eq(sender2.id)
        expect(messages[:data].first[:attributes]).to have_key(:message)
      end
      xit 'sends a succesful response with all messages from the last 30 days if requested' do
        sender1 = User.create!(
          user_name: 'Joey'
        )
        sender2 = User.create!(
          user_name: 'Charlie'
        )
        receiver = User.create!(
          user_name: 'Val'
        )
        create_list(:message, 55, user_id: receiver.id, sender_id: sender1.id)
        create_list(:message, 55, user_id: receiver.id, sender_id: sender2.id)
        get "/api/v1/messages", params: {
          "last_30_days": false
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
      end
    end
    describe 'Sad Path' do
      xit 'sends an error when a messsage when no message form is provided ' do
        sender = User.create!(
          user_name: 'Joey'
        )
        receiver = User.create!(
          user_name: 'Val'
        )
        get "/api/v1/messages/#{receiver.id}", params: {
          "sender": sender.id,
        }
        message = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(400)
        expect(message).to have_key(:errors)

      end
      xit 'sends an error when a messsage when form requirement is not valid ' do
        sender = User.create!(
          user_name: 'Joey'
        )
        receiver = User.create!(
          user_name: 'Val'
        )
        get "/api/v1/messages/#{receiver.id}", params: {
          "sender": sender.id,
          "last_30_days": "abc"
        }
        message = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(400)
        expect(message).to have_key(:errors)

      end
    end
  end
end
