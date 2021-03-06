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
    case params[:last_30_days]
    when 'true'
      messages = @receiver.messages.where(sender_id: @sender.id).where('created_at > ?',
                                                                       30.days.ago).order(created_at: :desc)
      render json: MessageSerializer.new(messages)
    when 'false'
      messages = @receiver.messages.where(sender_id: @sender.id).limit(100).order(created_at: :desc)
      render json: MessageSerializer.new(messages)
    else
      render json: { errors: 'missing required params' }, status: :bad_request
    end
  end

  def index
    case params[:last_30_days]
    when 'true'
      messages = Message.where('created_at > ?', 30.days.ago).order(created_at: :desc)
      render json: MessageSerializer.new(messages)
    when 'false'
      messages = Message.all.limit(100).order(created_at: :desc)
      render json: MessageSerializer.new(messages)
    else
      render json: { errors: 'missing required params' }, status: :bad_request
    end
  end

  private

  def set_receiver
    @receiver = User.find_by(id: params[:id])
  end

  def set_sender
    @sender = User.find_by(id: params[:sender])
  end
end
