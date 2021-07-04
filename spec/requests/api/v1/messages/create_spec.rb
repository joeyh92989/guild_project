require 'rails_helper'

describe 'Message Create' do
  describe 'Message Create' do
    describe 'Happy Path' do
      it 'send a succesful response when a valid message is created ' do
        sender = User.create!(
          user_name: 'Joey'
        )
        receiver = User.create!(
          user_name: 'Val'
        )
        post '/api/v1/messages', params: {
          "user_id": receiver.id,
          "sender": sender.id,
          "message": 'test'
        }
        message = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(response.status).to eq(201)
        expect(message[:data][:attributes]).to have_key(:user)
        expect(message[:data][:attributes][:user][:id]).to eq(receiver.id)
        expect(message[:data][:attributes]).to have_key(:sender)
        expect(message[:data][:attributes][:sender][:id]).to eq(sender.id)
        expect(message[:data][:attributes]).to have_key(:message)
        expect(message[:data][:attributes][:message]).to eq("test")
      end
    end
    describe 'Sad Path' do
      it 'sends an error when a messsage of no length is sent' do
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
