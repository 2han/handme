class AppliesController < ApplicationController
  before_action :set_apply, only: [:show, :edit, :update, :destroy, :approve]

  # GET /applies
  # GET /applies.json
  def index
    @jobs = current_user.jobs
  end

  # GET /applies/1
  # GET /applies/1.json
  def show
  end

  # GET /applies/new
  def new
    @apply = Apply.new
  end

  # GET /applies/1/edit
  def edit
  end

  # POST /applies
  # POST /applies.json
  def create
    @job = Job.find(params[:job_id])
    current_user.apply!(@job)
    redirect_to @job
  end

  def approve
    # @applyのstatusを1にする
    @apply.status = 1
    @apply.save
    # saveする
    # redirectする
    redirect_to  @apply
  end


  # PATCH/PUT /applies/1
  # PATCH/PUT /applies/1.json
  def update
    respond_to do |format|
      if @apply.update(apply_params)
        format.html { redirect_to @apply, notice: 'Apply was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @apply.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /applies/1
  # DELETE /applies/1.json
  def destroy
    @job = Apply.find(params[:id]).job
    current_user.unapply!(@job)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apply
      @apply = Apply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apply_params
      params.require(:apply).permit(:user_id, :job_id, :status)
    end
end
