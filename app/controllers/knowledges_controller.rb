class KnowledgesController < ApplicationController
  before_action :set_knowledge, only: %i[ show update destroy ]
  before_action :authenticate_user!
  # GET /knowledges
  def index
    @knowledges = Knowledge.all
    # @knowledges = current_user
    # chat_gpt_service = ChatGptService.new
    # # @chat_gpt = chat_gpt_service.chat("output 1 knowledge. about 50words. ")
    @user = current_user
    # @knowledges[0].update(content:chat_gpt_service.chat("output 1 valuable knowledge. about 50words"))
    # @knowledges[1].update(content: current_user)
    render json: { knowledges: @knowledges ,user: @user}
    # render json: @knowledges



  end

  # GET /knowledges/1
  def show
    render json: @knowledge
  end

  # POST /knowledges
  def create
    @knowledge = Knowledge.new(knowledge_params)

    if @knowledge.save
      render json: @knowledge, status: :created, location: @knowledge
    else
      render json: @knowledge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /knowledges/1
  def update
    if @knowledge.update(knowledge_params)
      render json: @knowledge
    else
      render json: @knowledge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /knowledges/1
  def destroy
    @knowledge.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_knowledge
      @knowledge = Knowledge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def knowledge_params
      params.require(:knowledge).permit(:title, :content, :condition)
    end
end
