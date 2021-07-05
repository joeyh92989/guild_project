class Api::V1::MessagesController < ApplicationController
  before_action :set_receiver, only: %i[create conversation_history]
  before_action :set_sender, only: %i[create conversation_history]
  def create
    message = Message.new(user_id: @receiver.id, sender_id: @sender.id, message: params[:message])
    if message.save
      render json: MessageSerializer.new(message), status: :created
    else
      render json: { errors: message.errors.full_messages }, status: :bad_request
    end
  end
  def conversation_history
    messages = @receiver.messages.where(sender_id: @sender.id).limit(100)
    render json: MessageSerializer.new(messages)
  end
  private

  def set_receiver
    @receiver = User.find_by(id: params[:id])
  end

  def set_sender
    @sender = User.find_by(id: params[:sender])
  end
end
