class MemoryListsController < ApplicationController
  before_action :set_memory_list, only: [:show, :edit, :update, :destroy]

  # GET /memory_lists
  # GET /memory_lists.json
  def index
    @memory_lists = MemoryList.all
  end

  # GET /memory_lists/1
  # GET /memory_lists/1.json
  def show
  end

  # GET /memory_lists/new
  def new
    @memory_list = MemoryList.new
  end

  # GET /memory_lists/1/edit
  def edit
  end

  # POST /memory_lists
  # POST /memory_lists.json
  def create
    @memory_list = MemoryList.new(memory_list_params)

    respond_to do |format|
      if @memory_list.save
        format.html { redirect_to @memory_list, notice: 'Memory list was successfully created.' }
        format.json { render :show, status: :created, location: @memory_list }
      else
        format.html { render :new }
        format.json { render json: @memory_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memory_lists/1
  # PATCH/PUT /memory_lists/1.json
  def update
    respond_to do |format|
      if @memory_list.update(memory_list_params)
        format.html { redirect_to @memory_list, notice: 'Memory list was successfully updated.' }
        format.json { render :show, status: :ok, location: @memory_list }
      else
        format.html { render :edit }
        format.json { render json: @memory_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memory_lists/1
  # DELETE /memory_lists/1.json
  def destroy
    @memory_list.destroy
    respond_to do |format|
      format.html { redirect_to memory_lists_url, notice: 'Memory list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memory_list
      @memory_list = MemoryList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memory_list_params
      params.require(:memory_list).permit(:title, :description, :date_created)
    end
end
