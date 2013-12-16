class MocksController < ApplicationController
  before_action :set_mock, only: [:show, :edit, :update, :destroy]

  # GET /mocks
  # GET /mocks.json
  def index
    @mocks = Mock.all
  end

  # GET /mocks/1
  # GET /mocks/1.json
  def show
    @comment = Comment.new(author_id: current_user.id, mock_id: params[:id])
  end

  # GET /mocks/new
  def new
    @mock = Mock.new
  end

  # GET /mocks/1/edit
  def edit
  end

  # POST /mocks
  # POST /mocks.json
  def create
    @mock = Mock.new(mock_params)

    respond_to do |format|
      if @mock.save
        format.html { redirect_to @mock, notice: 'Mock was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mock }
      else
        format.html { render action: 'new' }
        format.json { render json: @mock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mocks/1
  # PATCH/PUT /mocks/1.json
  def update
    respond_to do |format|
      if @mock.update(mock_params)
        format.html { redirect_to @mock, notice: 'Mock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mocks/1
  # DELETE /mocks/1.json
  def destroy
    @mock.destroy
    respond_to do |format|
      format.html { redirect_to mocks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mock
      @mock = Mock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mock_params
      params.require(:mock).permit(:image).tap do |safe_params|
        if params[:action] == 'create'
          safe_params.merge!(creator_id: current_user.id)
        end
      end
    end
end
