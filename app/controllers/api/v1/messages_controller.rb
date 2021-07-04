class Api::V1::MessagesController < ApplicationController
  before_action :set_receiver, only: %i[create]
  before_action :set_sender, only: %i[create]
  def create
    binding.pry
  end

  private
  def set_receiver
    @receiver = User.find_by(id: params[:message][:user_id])
  end

  def set_sender
    @sender = User.find_by(id: params[:message][:sender])
  end

  def message_params
    params.require(:messsage).permit(:user_id, :message, :sender)
  end
end