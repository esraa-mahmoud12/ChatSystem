class ChatsController < ApplicationController
  before_action :set_chat, only: %i[ show edit update destroy ]

  
  # GET /chats or /chats.json
  def index
    @application = Application.find(params[:application_id])
    @chats=Chat.where(application_id: @application.id).all
    
  end

  # GET /chats/1 or /chats/1.json
  def show
    
      @chat = Chats.find(params[:id])
  
  end

  # GET /chats/new
  def new
    @chat = Chat.new

  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats or /chats.json
  def create
    @application = Application.find(params[:application_id])
    @application.chat_count = @application.chats.size
    @application.update(chat_count:@application.chats.size )
    chat = @application.chats.create
    chat.number = @application.chats.size+1

    #application.chat_count = application.chats.size 
    #redirect_to application_path(application)
    #chat = chat_params.merge({number: chat_number, application_id: @application.id})
    render json: {msg: "Chat created successfully", number: chat.number}, status: :created


  end

  # PATCH/PUT /chats/1 or /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to chat_url(@chat), notice: "Chat was successfully updated." }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1 or /chats/1.json
  def destroy
    Chat.destroy(@chat.id)
    render json: {msg: "Chat destroyed successfully"}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chat_params
      params.require(:chat)
    end


   
end
