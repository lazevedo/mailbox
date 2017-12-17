class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update]

  # GET /messages
  def index
    @messages = Message.all
    json_response(@messages) # filtrar por usuario
  end

  # POST /messages
  def create
    @message = Message.create!(message_params)
    json_response(@message, :created)
  end

  # GET /messages/:id
  def show
    json_response(@message)
  end

  # PUT /messages/:id
  def update
    @message.update(message_params)
    head :no_content
  end

  private

  def message_params
    params.permit(:title, :body)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
