class BatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_batch, only: %i[ show edit update destroy ]

  # GET /batches or /batches.json
  def index
    if current_user.school_admin?
      @batches = current_user.batches
    else
      @batches = Batch.enrolled_batches(current_user.id)
    end
  end

  # GET /batches/1 or /batches/1.json
  def show
  end

  # GET /batches/new
  def new
    @batch = Batch.new
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches or /batches.json
  def create
    @batch = Batch.new(batch_params)
    @batch.user_id = current_user.id
    respond_to do |format|
      if @batch.save
        format.html { redirect_to batches_url, notice: "Batch was successfully created." }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1 or /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to batches_url, notice: "Batch was successfully updated." }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1 or /batches/1.json
  def destroy
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to batches_url, notice: "Batch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def related_courses
    @courses = Course.includes(:batches).where(school_id: params[:school_id])
    render json: @courses
  end

  def related_batches
    @batches = Batch.where(course_id: params[:course_id])
    render json: @batches
  end

  def batch_mates
    @batches = Batch.enrolled_batches(current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def batch_params
      params.require(:batch).permit(:name, :start_time, :end_time, :every_day, :course_id)
    end
end
