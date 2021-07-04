class Api::V1::MessagesController < ApplicationController
  before_action :set_receiver, only: %i[create]
  before_action :set_sender, only: %i[create]
  def create
    message = Message.new(user_id: @receiver.id, sender_id: @sender.id, message: params[:message])
    if message.save
    render json: MessageSerializer.new(message), status: :created
    else
    end
  end

  private
  def set_receiver
    @receiver = User.find_by(id: params[:user_id])
  end

  def set_sender
    @sender = User.find_by(id: params[:sender])
  end

end