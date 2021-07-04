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
        post '/api/v1/messages', params: { message: {
          "user_id": receiver.id,
          "sender": sender.id,
          "message": 'test'
        } }
        message = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(response.status).to eq(201)
      end
    end
    describe 'Sad Path' do
      xit 'sends an error when a messsage of no length is sent' do
      end
    end
  end
end
